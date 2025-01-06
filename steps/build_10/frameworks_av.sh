
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

echo "Preparing for frameworks/av"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/aac
clone_depth_platform external/boringssl
clone_depth_platform external/compiler-rt
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/jsmn
clone_depth_platform external/libavc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libgav1
clone_depth_platform external/libgsm
clone_depth_platform external/libhevc
clone_depth_platform external/libmpeg2
clone_depth_platform external/libopus
clone_depth_platform external/libvpx
clone_depth_platform external/libyuv
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/tremolo
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/sdk prebuilts/sdk android12-gsi "/14/public/android.jar" "/15/public/android.jar" "/16/public/android.jar" "/17/public/android.jar" "/21/public/android.jar" "/28/public/android.jar" "/28/public/org.apache.http.legacy.jar" "/29/public/android.jar" "/29/system/android.jar" "/30/module-lib/android.jar" "/30/public/android.jar" "/30/public/core-for-system-modules.jar" "/30/system/android.jar" "/31/module-lib/android.jar" "/31/module-lib/api/android.net.ipsec.ike-removed.txt" "/31/module-lib/api/android.net.ipsec.ike.txt" "/31/module-lib/api/android-non-updatable-removed.txt" "/31/module-lib/api/android-non-updatable.txt" "/31/module-lib/api/android.txt" "/31/module-lib/api/art-removed.txt" "/31/module-lib/api/art.txt" "/31/module-lib/api/framework-connectivity-removed.txt" "/31/module-lib/api/framework-connectivity.txt" "/31/module-lib/api/framework-mediaprovider-removed.txt" "/31/module-lib/api/framework-mediaprovider.txt" "/31/module-lib/api/framework-media-removed.txt" "/31/module-lib/api/framework-media.txt" "/31/module-lib/api/framework-permission-removed.txt" "/31/module-lib/api/framework-permission-s-removed.txt" "/31/module-lib/api/framework-permission-s.txt" "/31/module-lib/api/framework-permission.txt" "/31/module-lib/api/framework-scheduling-removed.txt" "/31/module-lib/api/framework-scheduling.txt" "/31/module-lib/api/framework-sdkextensions-removed.txt" "/31/module-lib/api/framework-sdkextensions.txt" "/31/module-lib/api/framework-statsd-removed.txt" "/31/module-lib/api/framework-statsd.txt" "/31/module-lib/api/framework-tethering-removed.txt" "/31/module-lib/api/framework-tethering.txt" "/31/module-lib/api/framework-wifi-removed.txt" "/31/module-lib/api/framework-wifi.txt" "/31/module-lib/framework-connectivity.jar" "/31/module-lib/framework-statsd.jar" "/31/module-lib/framework-wifi.jar" "/31/public/api/android.net.ipsec.ike-removed.txt" "/31/public/api/android.net.ipsec.ike.txt" "/31/public/api/android-non-updatable-incompatibilities.txt" "/31/public/api/android-non-updatable-removed.txt" "/31/public/api/android-non-updatable.txt" "/31/public/api/android.txt" "/31/public/api/art-removed.txt" "/31/public/api/art.txt" "/31/public/api/conscrypt-removed.txt" "/31/public/api/conscrypt.txt" "/31/public/api/framework-connectivity-removed.txt" "/31/public/api/framework-connectivity.txt" "/31/public/api/framework-mediaprovider-removed.txt" "/31/public/api/framework-mediaprovider.txt" "/31/public/api/framework-media-removed.txt" "/31/public/api/framework-media.txt" "/31/public/api/framework-permission-removed.txt" "/31/public/api/framework-permission-s-removed.txt" "/31/public/api/framework-permission-s.txt" "/31/public/api/framework-permission.txt" "/31/public/api/framework-scheduling-removed.txt" "/31/public/api/framework-scheduling.txt" "/31/public/api/framework-sdkextensions-removed.txt" "/31/public/api/framework-sdkextensions.txt" "/31/public/api/framework-statsd-removed.txt" "/31/public/api/framework-statsd.txt" "/31/public/api/framework-tethering-removed.txt" "/31/public/api/framework-tethering.txt" "/31/public/api/framework-wifi-removed.txt" "/31/public/api/framework-wifi.txt" "/31/public/api/org.apache.http.legacy-removed.txt" "/31/public/api/org.apache.http.legacy.txt" "/31/public/api/runtime-i18n-removed.txt" "/31/public/api/runtime-i18n.txt" "/31/public/core-for-system-modules.jar" "/31/system/api/android.net.ipsec.ike-incompatibilities.txt" "/31/system/api/android.net.ipsec.ike-removed.txt" "/31/system/api/android.net.ipsec.ike.txt" "/31/system/api/android-non-updatable-incompatibilities.txt" "/31/system/api/android-non-updatable-removed.txt" "/31/system/api/android-non-updatable.txt" "/31/system/api/android.test.base-removed.txt" "/31/system/api/android.test.base.txt" "/31/system/api/android.test.mock-removed.txt" "/31/system/api/android.test.mock.txt" "/31/system/api/android.test.runner-removed.txt" "/31/system/api/android.test.runner.txt" "/31/system/api/android.txt" "/31/system/api/art-removed.txt" "/31/system/api/art.txt" "/31/system/api/framework-connectivity-removed.txt" "/31/system/api/framework-connectivity.txt" "/31/system/api/framework-mediaprovider-removed.txt" "/31/system/api/framework-mediaprovider.txt" "/31/system/api/framework-media-removed.txt" "/31/system/api/framework-media.txt" "/31/system/api/framework-permission-removed.txt" "/31/system/api/framework-permission-s-removed.txt" "/31/system/api/framework-permission-s.txt" "/31/system/api/framework-permission.txt" "/31/system/api/framework-scheduling-removed.txt" "/31/system/api/framework-scheduling.txt" "/31/system/api/framework-sdkextensions-removed.txt" "/31/system/api/framework-sdkextensions.txt" "/31/system/api/framework-statsd-removed.txt" "/31/system/api/framework-statsd.txt" "/31/system/api/framework-tethering-removed.txt" "/31/system/api/framework-tethering.txt" "/31/system/api/framework-wifi-removed.txt" "/31/system/api/framework-wifi.txt" "/31/system/api/org.apache.http.legacy-removed.txt" "/31/system/api/org.apache.http.legacy.txt" "/31/system-server/api/android-non-updatable.txt" "/31/system-server/api/service-permission-removed.txt" "/31/system-server/api/service-permission.txt" "/8/public/android.jar" "/9/public/android.jar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar" "/current/androidx-legacy/manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml" "/current/androidx/m2repository/androidx/activity/activity/1.3.0-alpha03/activity-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/activity/activity-ktx/1.3.0-alpha03/activity-ktx-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/annotation/annotation/1.3.0-alpha01/annotation-1.3.0-alpha01.jar" "/current/androidx/m2repository/androidx/annotation/annotation-experimental/1.2.0-alpha01/annotation-experimental-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat/1.3.0-beta02/appcompat-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat-resources/1.3.0-beta02/appcompat-resources-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/autofill/autofill/1.2.0-alpha01/autofill-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/collection/collection/1.2.0-alpha02/collection-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/collection/collection-ktx/1.2.0-alpha02/collection-ktx-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/concurrent/concurrent-futures/1.2.0-alpha01/concurrent-futures-1.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/core/core/1.6.0-beta03/core-1.6.0-beta03.aar" "/current/androidx/m2repository/androidx/core/core-ktx/1.5.0-beta02/core-ktx-1.5.0-beta02.aar" "/current/androidx/m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar" "/current/androidx/m2repository/androidx/exifinterface/exifinterface/1.4.0-alpha01/exifinterface-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment/1.4.0-alpha01/fragment-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment-ktx/1.4.0-alpha01/fragment-ktx-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/leanback/leanback/1.1.0-beta01/leanback-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/leanback/leanback-preference/1.1.0-beta01/leanback-preference-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common/2.4.0-alpha01/lifecycle-common-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common-java8/2.4.0-alpha01/lifecycle-common-java8-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata/2.4.0-alpha01/lifecycle-livedata-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core/2.4.0-alpha01/lifecycle-livedata-core-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.4.0-alpha01/lifecycle-livedata-core-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-process/2.4.0-alpha01/lifecycle-process-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime/2.4.0-alpha01/lifecycle-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.4.0-alpha01/lifecycle-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-service/2.4.0-alpha01/lifecycle-service-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel/2.4.0-alpha01/lifecycle-viewmodel-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.4.0-alpha01/lifecycle-viewmodel-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.4.0-alpha01/lifecycle-viewmodel-savedstate-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/media/media/1.3.0-beta01/media-1.3.0-beta01.aar" "/current/androidx/m2repository/androidx/mediarouter/mediarouter/1.3.0-alpha01/mediarouter-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/print/print/1.1.0-beta01/print-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview/1.3.0-alpha01/recyclerview-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar" "/current/androidx/m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar" "/current/androidx/m2repository/androidx/room/room-common/2.3.0-beta02/room-common-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler/2.3.0-beta02/room-compiler-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler-processing/2.3.0-beta02/room-compiler-processing-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-migration/2.3.0-beta02/room-migration-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-runtime/2.3.0-beta02/room-runtime-2.3.0-beta02.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate/1.2.0-alpha01/savedstate-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate-ktx/1.2.0-alpha01/savedstate-ktx-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite/2.2.0-alpha01/sqlite-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite-framework/2.2.0-alpha01/sqlite-framework-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.2.0-alpha01/swiperefreshlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/tracing/tracing/1.1.0-alpha01/tracing-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/transition/transition/1.5.0-alpha01/transition-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha03/vectordrawable-1.2.0-alpha03.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/webkit/webkit/1.5.0-alpha01/webkit-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/work/work-runtime/2.7.0-alpha02/work-runtime-2.7.0-alpha02.aar" "/current/androidx/m2repository/androidx/work/work-runtime-ktx/2.7.0-alpha02/work-runtime-ktx-2.7.0-alpha02.aar" "/current/androidx/manifests/androidx.activity_activity/AndroidManifest.xml" "/current/androidx/manifests/androidx.activity_activity-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.annotation_annotation-experimental/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml" "/current/androidx/manifests/androidx.arch.core_core-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml" "/current/androidx/manifests/androidx.autofill_autofill/AndroidManifest.xml" "/current/androidx/manifests/androidx.cardview_cardview/AndroidManifest.xml" "/current/androidx/manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml" "/current/androidx/manifests/androidx.customview_customview/AndroidManifest.xml" "/current/androidx/manifests/androidx.documentfile_documentfile/AndroidManifest.xml" "/current/androidx/manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml" "/current/androidx/manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.interpolator_interpolator/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback-preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.loader_loader/AndroidManifest.xml" "/current/androidx/manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml" "/current/androidx/manifests/androidx.media_media/AndroidManifest.xml" "/current/androidx/manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.palette_palette/AndroidManifest.xml" "/current/androidx/manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.preference_preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.print_print/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml" "/current/androidx/manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml" "/current/androidx/manifests/androidx.room_room-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-builders/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-view/AndroidManifest.xml" "/current/androidx/manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml" "/current/androidx/manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.tracing_tracing/AndroidManifest.xml" "/current/androidx/manifests/androidx.transition_transition/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml" "/current/androidx/manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager_viewpager/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime-ktx/AndroidManifest.xml" "/current/extras/app-toolkit/m2repository/android/arch/core/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/core/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/livedata-core/28.0.0/livedata-core-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/viewmodel/28.0.0/viewmodel-28.0.0.aar" "/current/extras/app-toolkit/manifests/android-arch-core-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-livedata-core/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-viewmodel/AndroidManifest.xml" "/current/extras/constraint-layout-x/constraintlayout/2.0.0-beta7/constraintlayout-2.0.0-beta7.aar" "/current/extras/constraint-layout-x/constraintlayout-solver/2.0.0-beta7/constraintlayout-solver-2.0.0-beta7.jar" "/current/extras/constraint-layout-x/manifests/androidx-constraintlayout_constraintlayout/AndroidManifest.xml" "/current/extras/material-design/design/com/android/support/design/28.0.0/design-28.0.0.aar" "/current/extras/material-design/manifests/android-support-design/AndroidManifest.xml" "/current/extras/material-design-x/com/google/android/material/material/1.4.0/material-1.4.0.aar" "/current/extras/material-design-x/manifests/com.google.android.material_material/AndroidManifest.xml" "/current/public/android.jar" "/current/support/m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar" "/current/support/m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar" "/current/support/m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar" "/current/support/m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar" "/current/support/m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar" "/current/support/m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar" "/current/support/m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar" "/current/support/m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar" "/current/support/m2repository/com/android/support/print/28.0.0/print-28.0.0.aar" "/current/support/m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar" "/current/support/m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar" "/current/support/m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar" "/current/support/m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar" "/current/support/m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar" "/current/support/m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar" "/current/support/m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar" "/current/support/m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar" "/current/support/m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar" "/current/support/manifests/android-support-animatedvectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-asynclayoutinflater/AndroidManifest.xml" "/current/support/manifests/android-support-compat/AndroidManifest.xml" "/current/support/manifests/android-support-coordinatorlayout/AndroidManifest.xml" "/current/support/manifests/android-support-core-ui/AndroidManifest.xml" "/current/support/manifests/android-support-core-utils/AndroidManifest.xml" "/current/support/manifests/android-support-cursoradapter/AndroidManifest.xml" "/current/support/manifests/android-support-customview/AndroidManifest.xml" "/current/support/manifests/android-support-documentfile/AndroidManifest.xml" "/current/support/manifests/android-support-drawerlayout/AndroidManifest.xml" "/current/support/manifests/android-support-dynamic-animation/AndroidManifest.xml" "/current/support/manifests/android-support-fragment/AndroidManifest.xml" "/current/support/manifests/android-support-interpolator/AndroidManifest.xml" "/current/support/manifests/android-support-loader/AndroidManifest.xml" "/current/support/manifests/android-support-localbroadcastmanager/AndroidManifest.xml" "/current/support/manifests/android-support-media-compat/AndroidManifest.xml" "/current/support/manifests/android-support-print/AndroidManifest.xml" "/current/support/manifests/android-support-slidingpanelayout/AndroidManifest.xml" "/current/support/manifests/android-support-swiperefreshlayout/AndroidManifest.xml" "/current/support/manifests/android-support-transition/AndroidManifest.xml" "/current/support/manifests/android-support-v13/AndroidManifest.xml" "/current/support/manifests/android-support-v4/AndroidManifest.xml" "/current/support/manifests/android-support-v7-appcompat/AndroidManifest.xml" "/current/support/manifests/android-support-v7-cardview/AndroidManifest.xml" "/current/support/manifests/android-support-v7-recyclerview/AndroidManifest.xml" "/current/support/manifests/android-support-vectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-viewpager/AndroidManifest.xml" "/current/support/manifests/android-versionedparcelable/AndroidManifest.xml" "/current/system/android.jar" "/current/system/android.net.ipsec.ike.jar" "/tools/core-lambda-stubs.jar" "/tools/linux/lib64/libclang_android.so" "/tools/linux/lib64/libLLVM_android.so"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libdmabufheap
clone_depth_platform system/memory/libion
clone_depth_platform system/memory/libmemunreachable
clone_depth_platform system/sepolicy
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/signapk/signapk^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/jsonmodify^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/aac/libFraunhoferAAC^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/avbtool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/make_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/sload_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flac/src/libFLAC/libFLAC^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsmn/libjsmn^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libavc/libavcdec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libavc/libavcenc^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libgav1/libgav1^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libgsm/libgsm^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libhevc/libhevcdec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libhevc/libhevcenc^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libmpeg2/libmpeg2dec^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libopus/libopus^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libvpx/libvpx^android_x86_64_shared_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv_static^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/sefcontext_compile^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tremolo/libvorbisidec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/apex/com.android.media.swcodec-ld.config.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/g711/decoder/codecs_g711dec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnblog/libnblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/data/mediaswcodec.xml^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediacodec/mediaswcodec.policy^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/medialog/libmedialogservice^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libplatformprotos^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_bufferqueue_static^android_x86_64_static_cfi_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexer/apexer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/code_coverage/code_coverage.policy^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/crash_dump.policy^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libion/libion^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable/libmemunreachable^android_x86_64_shared/ .

echo "building com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja com.android.media.swcodec,android_common_cfi_com.android.media.swcodec_image
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image.output $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image/addition_copy_files.output

echo "building drmserver^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja drmserver,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/drmserver^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/drmserver^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64/addition_copy_files.output

echo "building libmediadrmmetrics_full^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediadrmmetrics_full,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_full^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_full^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared/addition_copy_files.output

echo "building libmediadrmmetrics_full^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediadrmmetrics_full,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_full^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_full^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmediadrmmetrics_lite^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediadrmmetrics_lite,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_lite^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_lite^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared/addition_copy_files.output

echo "building libmediadrmmetrics_lite^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediadrmmetrics_lite,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_lite^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediadrmmetrics_lite^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared/addition_copy_files.output

echo "building android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja android.hardware.drm@1.4-service.clearkey,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstagefright_bufferpool@2.0.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstagefright_bufferpool@2.0.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_aacdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_aacenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_amrnbdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_amrwbdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_amrnbenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_amrwbenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_avcdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_avcenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_common,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_flacdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_flacenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_g711alawdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_g711mlawdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_av1dec_gav1,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_gsmdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_hevcdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_hevcenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_mp3dec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_mpeg2dec,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_mpeg4dec,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_h263dec,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_mpeg4enc,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_h263enc,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_opusdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_opusenc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_rawdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_vorbisdec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_vp9dec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_vp8dec,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_vp9enc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_soft_vp8enc,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_hidl@1.0,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_hidl@1.1,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_hidl@1.2,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libsfplugin_ccodec_utils,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libcodec2_vndk,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libaaudio^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaaudio,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared/addition_copy_files.output

echo "building libaaudio^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaaudio,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared/addition_copy_files.output

echo "building aaudio-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja aaudio-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/aaudio-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/aaudio-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building aaudio-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja aaudio-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/aaudio-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/aaudio-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaaudio_internal^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaaudio_internal,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio_internal^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio_internal^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared/addition_copy_files.output

echo "building libaaudio_internal^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaaudio_internal,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio_internal^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaaudio_internal^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudioclient_aidl_conversion^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudioclient_aidl_conversion,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient_aidl_conversion^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient_aidl_conversion^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared/addition_copy_files.output

echo "building libaudioclient_aidl_conversion^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudioclient_aidl_conversion,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient_aidl_conversion^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient_aidl_conversion^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared/addition_copy_files.output

echo "building audioclient-types-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audioclient-types-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioclient-types-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioclient-types-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building audioclient-types-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audioclient-types-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioclient-types-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioclient-types-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building audiopolicy-types-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audiopolicy-types-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building audiopolicy-types-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audiopolicy-types-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building audioflinger-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audioflinger-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioflinger-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioflinger-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building audioflinger-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audioflinger-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioflinger-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audioflinger-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicy^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiopolicy,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiopolicy^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiopolicy^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicy^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiopolicy,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiopolicy^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiopolicy^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared/addition_copy_files.output

echo "building audiopolicy-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audiopolicy-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building audiopolicy-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja audiopolicy-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/audiopolicy-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudioclient^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudioclient,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared/addition_copy_files.output

echo "building libaudioclient^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudioclient,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudioclient^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiofoundation^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiofoundation,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiofoundation^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiofoundation^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared/addition_copy_files.output

echo "building libaudiofoundation^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiofoundation,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiofoundation^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiofoundation^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@6.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@6.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@6.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@6.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@6.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@6.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@6.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@6.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@7.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@7.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@7.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@7.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@7.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@7.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@7.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@7.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@4.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@4.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@4.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@4.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@5.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@5.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@5.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@5.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal@5.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libaudiohal@5.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@5.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libaudiohal@5.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmedia_codeclist^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmedia_codeclist,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codeclist^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codeclist^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia_codeclist^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmedia_codeclist,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codeclist^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codeclist^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstagefright_bufferqueue_helper_novndk,android_x86_64_shared_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libmediautils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediautils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediautils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediautils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_shared/addition_copy_files.output

echo "building libmediautils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediautils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediautils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediautils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared/addition_copy_files.output

echo "building mediaswcodec^android_x86_64_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja mediaswcodec,android_x86_64_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/mediaswcodec^android_x86_64_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/mediaswcodec^android_x86_64_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec/addition_copy_files.output

echo "building libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmedia_codecserviceregistrant,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec/addition_copy_files.output

echo "building libmedialogservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmedialogservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedialogservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmedialogservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared/addition_copy_files.output

echo "building mediametrics^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja mediametrics,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/mediametrics^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/mediametrics^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/mediametrics^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/mediametrics^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/mediametrics^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/mediametrics^android_x86_64/addition_copy_files.output

echo "building libmediametricsservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmediametricsservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediametricsservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/av/libmediametricsservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_aac.tar.zst" ]; then
  echo "Compressing external/aac -> external_aac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_aac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/aac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.zst" ]; then
  echo "Compressing external/flac -> external_flac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsmn.tar.zst" ]; then
  echo "Compressing external/jsmn -> external_jsmn.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsmn.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsmn/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libavc.tar.zst" ]; then
  echo "Compressing external/libavc -> external_libavc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libavc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libavc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libgav1.tar.zst" ]; then
  echo "Compressing external/libgav1 -> external_libgav1.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libgav1.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libgav1/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libgsm.tar.zst" ]; then
  echo "Compressing external/libgsm -> external_libgsm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libgsm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libgsm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libhevc.tar.zst" ]; then
  echo "Compressing external/libhevc -> external_libhevc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libhevc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libhevc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst" ]; then
  echo "Compressing external/libmpeg2 -> external_libmpeg2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libmpeg2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tremolo.tar.zst" ]; then
  echo "Compressing external/tremolo -> external_tremolo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tremolo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tremolo/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst" ]; then
  echo "Compressing system/memory/libdmabufheap -> system_memory_libdmabufheap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libdmabufheap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst" ]; then
  echo "Compressing system/memory/libion -> system_memory_libion.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libion/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst" ]; then
  echo "Compressing system/memory/libmemunreachable -> system_memory_libmemunreachable.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libmemunreachable/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
