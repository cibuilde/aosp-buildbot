set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/icu
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/NetworkStack
clone_depth_platform packages/modules/Permission
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gsid
clone_depth_platform system/iorap
clone_depth_platform system/libhidl
clone_depth_platform system/timezone
clone_depth_platform system/vold
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/art/build/boot/art-bootclasspath-fragment^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dex2oat/dex2oatd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/profman/profman^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4j/icu4j_calendar_astronomer^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/location/lib/com.android.location.provider^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/sysprop/com.android.sysprop.watchdog^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/device-state-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/display-device-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/display-layout-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/errorprone/error_prone_android_framework_lib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/locked_region_code_injection/lockedregioncodeinjection^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/cmds/idmap2/overlayable_policy_aidl-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/platform-compat-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/platform-compat-overrides^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/services.core.protologsrc^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/coverage/services.coverage^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/java/com/android/server/speech/services.speech^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/wifi/services.wifi^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/statslog-art-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/java/statslog-framework-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/net-utils-services-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/client-libs/netd-client^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/common/netlinkclient/netlink-client^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/common/networkstackclient/networkstack-client^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/service/service-permission.stubs.system_server^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/timezone/distro/core/time_zone_distro^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/timezone/distro/installer/time_zone_distro_installer^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/app-compat-annotations^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/changeid/compat-changeid-annotation-processor^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .

echo "building services.core^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.core,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.core^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common

echo "building backuplib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja backuplib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/backuplib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common

echo "building service-blobstore^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja service-blobstore,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/service-blobstore^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common

echo "building service-jobscheduler^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja service-jobscheduler,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/service-jobscheduler^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common

echo "building services-platform-compat-config^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services-platform-compat-config,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services-platform-compat-config^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common

echo "building services.accessibility^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.accessibility,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.accessibility^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common

echo "building services.appprediction^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.appprediction,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.appprediction^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common

echo "building services.appwidget^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.appwidget,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.appwidget^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common

echo "building services.autofill^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.autofill,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.autofill^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common

echo "building services.backup^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.backup,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.backup^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common

echo "building services.companion^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.companion,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.companion^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common

echo "building services.contentcapture^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.contentcapture,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.contentcapture^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common

echo "building services.contentsuggestions^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.contentsuggestions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.contentsuggestions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common

echo "building services.core.unboosted^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.core.unboosted,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.core.unboosted^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common

echo "building services.core.priorityboosted^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.core.priorityboosted,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.core.priorityboosted^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common

echo "building services.devicepolicy^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.devicepolicy,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.devicepolicy^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common

echo "building services.midi^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.midi,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.midi^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common

echo "building services.musicsearch^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.musicsearch,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.musicsearch^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common

echo "building services.net^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.net,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/net/services.net^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.net^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/net/services.net^android_common

echo "building services.people^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.people,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.people^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common

echo "building services.print^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.print,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.print^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common

echo "building services.profcollect^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.profcollect,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.profcollect^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common

echo "building services.restrictions^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.restrictions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.restrictions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common

echo "building services.searchui^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.searchui,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.searchui^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common

echo "building services.smartspace^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.smartspace,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.smartspace^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common

echo "building services.startop.iorap^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.startop.iorap,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.startop.iorap^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common

echo "building services.startop^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.startop,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.startop^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common

echo "building services.systemcaptions^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.systemcaptions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.systemcaptions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common

echo "building services.texttospeech^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.texttospeech,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.texttospeech^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common

echo "building services.translation^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.translation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.translation^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common

echo "building services.usage^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.usage,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.usage^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common

echo "building services.usb^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.usb,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.usb^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common

echo "building services.uwb^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.uwb,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.uwb^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common

echo "building services.voiceinteraction^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services.voiceinteraction,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services.voiceinteraction^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common

echo "building services^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_33.ninja services,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_33/frameworks/base/services^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_33 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst" ]; then
  echo "Compressing packages/modules/NetworkStack -> packages_modules_NetworkStack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NetworkStack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_iorap.tar.zst" ]; then
  echo "Compressing system/iorap -> system_iorap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_iorap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/iorap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_timezone.tar.zst" ]; then
  echo "Compressing system/timezone -> system_timezone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_timezone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/timezone/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_vold.tar.zst" ]; then
  echo "Compressing system/vold -> system_vold.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_vold.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/vold/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi

rm -rf aosp
