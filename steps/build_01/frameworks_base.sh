set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform art
clone_depth_platform bionic
clone_sparse cts libs/json
clone_depth_platform external/expat
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libpng
clone_depth_platform external/tinyxml2
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding
clone_sparse_exclude tools/dexter !/testdata

echo "building AndroidClock.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja AndroidClock.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/AndroidClock.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64

echo "building DroidSansMono.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja DroidSansMono.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/DroidSansMono.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64

echo "building abx2xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja abx2xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/abx2xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/abx2xml^android_x86_64

echo "building amidi^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja amidi,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/amidi^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/amidi^

echo "building android.test.base.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.base.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.base.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.xml^android_common

echo "building android.test.mock.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.mock.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.mock.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.xml^android_common

echo "building android.test.runner.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja android.test.runner.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/android.test.runner.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.xml^android_common

echo "building appops^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja appops,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/appops^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/appops/appops^android_x86_64

echo "building com.android.future.usb.accessory.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.future.usb.accessory.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.future.usb.accessory.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common

echo "building com.android.location.provider.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.location.provider.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.location.provider.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/location/lib/com.android.location.provider.xml^android_common

echo "building com.android.media.remotedisplay.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.media.remotedisplay.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.media.remotedisplay.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common

echo "building com.android.mediadrm.signer.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.mediadrm.signer.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.mediadrm.signer.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common

echo "building com.android.nfc_extras.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.nfc_extras.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/com.android.nfc_extras.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common

echo "building device_config^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja device_config,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/device_config^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/device_config/device_config^android_x86_64

echo "building dpm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja dpm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/dpm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/dpm/dpm^android_x86_64

echo "building fonts.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja fonts.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/fonts.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/fonts/fonts.xml^android_x86_64

echo "building framework-sysconfig.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja framework-sysconfig.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/framework-sysconfig.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64

echo "building gps_debug.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gps_debug.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/gps_debug.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/gps_debug.conf^android_x86_64

echo "building hiddenapi-package-whitelist.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja hiddenapi-package-whitelist.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/hiddenapi-package-whitelist.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64

echo "building ime^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ime,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/ime^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/ime/ime^android_x86_64

echo "building input^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja input,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/input^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/input/input^android_x86_64

echo "building javax.obex.xml^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja javax.obex.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/javax.obex.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/obex/javax.obex.xml^android_common

echo "building libaapt^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libaapt,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libaapt^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt/libaapt^linux_glibc_x86_64_static

echo "building libidmap2_policies^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libidmap2_policies,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libidmap2_policies^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static

echo "building liblockagent^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblockagent,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/liblockagent^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static

echo "building libprotoutil^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static

echo "building libprotoutil^android_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_apex30

echo "building libprotoutil^android_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_static_lto-thin

echo "building libprotoutil^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static

echo "building libprotoutil^android_x86_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprotoutil,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libprotoutil^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_static_lto-thin

echo "building libviewcompiler^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libviewcompiler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/libviewcompiler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/view_compiler/libviewcompiler^android_x86_64_static

echo "building platform.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/platform.xml^android_x86_64

echo "building pm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja pm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/pm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/pm/pm^android_x86_64

echo "building preinstalled-packages-platform-overlays.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-overlays.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform-overlays.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64

echo "building preinstalled-packages-platform.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/preinstalled-packages-platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64

echo "building privapp-permissions-platform.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp-permissions-platform.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp-permissions-platform.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64

echo "building privapp_whitelist_com.android.carrierconfig^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.carrierconfig,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.carrierconfig^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64

echo "building privapp_whitelist_com.android.contacts^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.contacts,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.contacts^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64

echo "building privapp_whitelist_com.android.dialer^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.dialer,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.dialer^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64

echo "building privapp_whitelist_com.android.documentsui^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.documentsui,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.documentsui^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64

echo "building privapp_whitelist_com.android.emergency^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.emergency,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.emergency^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64

echo "building privapp_whitelist_com.android.imsserviceentitlement^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.imsserviceentitlement,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64

echo "building privapp_whitelist_com.android.launcher3^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.launcher3,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.launcher3^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64

echo "building privapp_whitelist_com.android.networkstack.tethering^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.networkstack.tethering,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack.tethering^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64

echo "building privapp_whitelist_com.android.networkstack^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.networkstack,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.networkstack^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64

echo "building privapp_whitelist_com.android.provision^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.provision,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.provision^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64

echo "building privapp_whitelist_com.android.settings.intelligence^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.settings.intelligence,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings.intelligence^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64

echo "building privapp_whitelist_com.android.settings^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.settings,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.settings^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64

echo "building privapp_whitelist_com.android.storagemanager^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.storagemanager,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.storagemanager^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64

echo "building privapp_whitelist_com.android.systemui^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja privapp_whitelist_com.android.systemui,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/privapp_whitelist_com.android.systemui^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64

echo "building settings^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja settings,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/settings^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/settings/settings^android_x86_64

echo "building start_with_lockagent^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja start_with_lockagent,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/start_with_lockagent^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64

echo "building wm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja wm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/wm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/wm/wm^android_x86_64

echo "building xml2abx^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja xml2abx,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/base/xml2abx^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/abx/xml2abx^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_base.tar.xz -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .

du -ah -d1

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  echo "Compressing art -> art.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  echo "Compressing bionic -> bionic.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.xz" ]; then
  echo "Compressing cts -> cts.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.xz -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.xz" ]; then
  echo "Compressing external/expat -> external_expat.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_expat.tar.xz -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.xz" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_googletest.tar.xz -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.xz" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libpng.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.xz" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.xz -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.xz" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.xz" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_base.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.xz" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/libnativehelper.tar.xz -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  echo "Compressing system/core -> system_core.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.xz" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.xz -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.xz" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libziparchive.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  echo "Compressing system/logging -> system_logging.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  echo "Compressing system/media -> system_media.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.xz" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.xz -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_dexter.tar.xz" ]; then
  echo "Compressing tools/dexter -> tools_dexter.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/tools_dexter.tar.xz -C $GITHUB_WORKSPACE/aosp/tools/dexter/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
