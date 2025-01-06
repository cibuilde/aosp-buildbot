
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

echo "Preparing for frameworks/base"

clone_depth_platform art
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/apache-http
clone_depth_platform external/icu
clone_depth_platform external/junit
clone_depth_platform external/kotlinc
clone_depth_platform external/lottie
clone_depth_platform external/xz-java
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/ex
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/libs/systemui
clone_depth_platform frameworks/native
clone_depth_platform frameworks/opt/net/ims
clone_depth_platform frameworks/opt/net/wifi
clone_depth_platform frameworks/opt/setupwizard
clone_depth_platform frameworks/opt/telephony
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/Permission
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/sdk prebuilts/sdk android12-gsi "/14/public/android.jar" "/15/public/android.jar" "/16/public/android.jar" "/17/public/android.jar" "/21/public/android.jar" "/28/public/android.jar" "/28/public/org.apache.http.legacy.jar" "/29/public/android.jar" "/29/system/android.jar" "/30/module-lib/android.jar" "/30/public/android.jar" "/30/public/core-for-system-modules.jar" "/30/system/android.jar" "/31/module-lib/android.jar" "/31/module-lib/api/android.net.ipsec.ike-removed.txt" "/31/module-lib/api/android.net.ipsec.ike.txt" "/31/module-lib/api/android-non-updatable-removed.txt" "/31/module-lib/api/android-non-updatable.txt" "/31/module-lib/api/android.txt" "/31/module-lib/api/art-removed.txt" "/31/module-lib/api/art.txt" "/31/module-lib/api/framework-connectivity-removed.txt" "/31/module-lib/api/framework-connectivity.txt" "/31/module-lib/api/framework-mediaprovider-removed.txt" "/31/module-lib/api/framework-mediaprovider.txt" "/31/module-lib/api/framework-media-removed.txt" "/31/module-lib/api/framework-media.txt" "/31/module-lib/api/framework-permission-removed.txt" "/31/module-lib/api/framework-permission-s-removed.txt" "/31/module-lib/api/framework-permission-s.txt" "/31/module-lib/api/framework-permission.txt" "/31/module-lib/api/framework-scheduling-removed.txt" "/31/module-lib/api/framework-scheduling.txt" "/31/module-lib/api/framework-sdkextensions-removed.txt" "/31/module-lib/api/framework-sdkextensions.txt" "/31/module-lib/api/framework-statsd-removed.txt" "/31/module-lib/api/framework-statsd.txt" "/31/module-lib/api/framework-tethering-removed.txt" "/31/module-lib/api/framework-tethering.txt" "/31/module-lib/api/framework-wifi-removed.txt" "/31/module-lib/api/framework-wifi.txt" "/31/module-lib/framework-connectivity.jar" "/31/module-lib/framework-statsd.jar" "/31/module-lib/framework-wifi.jar" "/31/public/api/android.net.ipsec.ike-removed.txt" "/31/public/api/android.net.ipsec.ike.txt" "/31/public/api/android-non-updatable-incompatibilities.txt" "/31/public/api/android-non-updatable-removed.txt" "/31/public/api/android-non-updatable.txt" "/31/public/api/android.txt" "/31/public/api/art-removed.txt" "/31/public/api/art.txt" "/31/public/api/conscrypt-removed.txt" "/31/public/api/conscrypt.txt" "/31/public/api/framework-connectivity-removed.txt" "/31/public/api/framework-connectivity.txt" "/31/public/api/framework-mediaprovider-removed.txt" "/31/public/api/framework-mediaprovider.txt" "/31/public/api/framework-media-removed.txt" "/31/public/api/framework-media.txt" "/31/public/api/framework-permission-removed.txt" "/31/public/api/framework-permission-s-removed.txt" "/31/public/api/framework-permission-s.txt" "/31/public/api/framework-permission.txt" "/31/public/api/framework-scheduling-removed.txt" "/31/public/api/framework-scheduling.txt" "/31/public/api/framework-sdkextensions-removed.txt" "/31/public/api/framework-sdkextensions.txt" "/31/public/api/framework-statsd-removed.txt" "/31/public/api/framework-statsd.txt" "/31/public/api/framework-tethering-removed.txt" "/31/public/api/framework-tethering.txt" "/31/public/api/framework-wifi-removed.txt" "/31/public/api/framework-wifi.txt" "/31/public/api/org.apache.http.legacy-removed.txt" "/31/public/api/org.apache.http.legacy.txt" "/31/public/api/runtime-i18n-removed.txt" "/31/public/api/runtime-i18n.txt" "/31/public/core-for-system-modules.jar" "/31/system/api/android.net.ipsec.ike-incompatibilities.txt" "/31/system/api/android.net.ipsec.ike-removed.txt" "/31/system/api/android.net.ipsec.ike.txt" "/31/system/api/android-non-updatable-incompatibilities.txt" "/31/system/api/android-non-updatable-removed.txt" "/31/system/api/android-non-updatable.txt" "/31/system/api/android.test.base-removed.txt" "/31/system/api/android.test.base.txt" "/31/system/api/android.test.mock-removed.txt" "/31/system/api/android.test.mock.txt" "/31/system/api/android.test.runner-removed.txt" "/31/system/api/android.test.runner.txt" "/31/system/api/android.txt" "/31/system/api/art-removed.txt" "/31/system/api/art.txt" "/31/system/api/framework-connectivity-removed.txt" "/31/system/api/framework-connectivity.txt" "/31/system/api/framework-mediaprovider-removed.txt" "/31/system/api/framework-mediaprovider.txt" "/31/system/api/framework-media-removed.txt" "/31/system/api/framework-media.txt" "/31/system/api/framework-permission-removed.txt" "/31/system/api/framework-permission-s-removed.txt" "/31/system/api/framework-permission-s.txt" "/31/system/api/framework-permission.txt" "/31/system/api/framework-scheduling-removed.txt" "/31/system/api/framework-scheduling.txt" "/31/system/api/framework-sdkextensions-removed.txt" "/31/system/api/framework-sdkextensions.txt" "/31/system/api/framework-statsd-removed.txt" "/31/system/api/framework-statsd.txt" "/31/system/api/framework-tethering-removed.txt" "/31/system/api/framework-tethering.txt" "/31/system/api/framework-wifi-removed.txt" "/31/system/api/framework-wifi.txt" "/31/system/api/org.apache.http.legacy-removed.txt" "/31/system/api/org.apache.http.legacy.txt" "/31/system-server/api/android-non-updatable.txt" "/31/system-server/api/service-permission-removed.txt" "/31/system-server/api/service-permission.txt" "/8/public/android.jar" "/9/public/android.jar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar" "/current/androidx-legacy/manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml" "/current/androidx/m2repository/androidx/activity/activity/1.3.0-alpha03/activity-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/activity/activity-ktx/1.3.0-alpha03/activity-ktx-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/annotation/annotation/1.3.0-alpha01/annotation-1.3.0-alpha01.jar" "/current/androidx/m2repository/androidx/annotation/annotation-experimental/1.2.0-alpha01/annotation-experimental-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat/1.3.0-beta02/appcompat-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat-resources/1.3.0-beta02/appcompat-resources-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/autofill/autofill/1.2.0-alpha01/autofill-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/collection/collection/1.2.0-alpha02/collection-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/collection/collection-ktx/1.2.0-alpha02/collection-ktx-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/concurrent/concurrent-futures/1.2.0-alpha01/concurrent-futures-1.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/core/core/1.6.0-beta03/core-1.6.0-beta03.aar" "/current/androidx/m2repository/androidx/core/core-ktx/1.5.0-beta02/core-ktx-1.5.0-beta02.aar" "/current/androidx/m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar" "/current/androidx/m2repository/androidx/exifinterface/exifinterface/1.4.0-alpha01/exifinterface-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment/1.4.0-alpha01/fragment-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment-ktx/1.4.0-alpha01/fragment-ktx-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/leanback/leanback/1.1.0-beta01/leanback-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/leanback/leanback-preference/1.1.0-beta01/leanback-preference-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common/2.4.0-alpha01/lifecycle-common-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common-java8/2.4.0-alpha01/lifecycle-common-java8-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata/2.4.0-alpha01/lifecycle-livedata-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core/2.4.0-alpha01/lifecycle-livedata-core-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.4.0-alpha01/lifecycle-livedata-core-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-process/2.4.0-alpha01/lifecycle-process-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime/2.4.0-alpha01/lifecycle-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.4.0-alpha01/lifecycle-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-service/2.4.0-alpha01/lifecycle-service-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel/2.4.0-alpha01/lifecycle-viewmodel-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.4.0-alpha01/lifecycle-viewmodel-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.4.0-alpha01/lifecycle-viewmodel-savedstate-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/media/media/1.3.0-beta01/media-1.3.0-beta01.aar" "/current/androidx/m2repository/androidx/mediarouter/mediarouter/1.3.0-alpha01/mediarouter-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/print/print/1.1.0-beta01/print-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview/1.3.0-alpha01/recyclerview-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar" "/current/androidx/m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar" "/current/androidx/m2repository/androidx/room/room-common/2.3.0-beta02/room-common-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler/2.3.0-beta02/room-compiler-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler-processing/2.3.0-beta02/room-compiler-processing-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-migration/2.3.0-beta02/room-migration-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-runtime/2.3.0-beta02/room-runtime-2.3.0-beta02.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate/1.2.0-alpha01/savedstate-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate-ktx/1.2.0-alpha01/savedstate-ktx-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite/2.2.0-alpha01/sqlite-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite-framework/2.2.0-alpha01/sqlite-framework-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.2.0-alpha01/swiperefreshlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/tracing/tracing/1.1.0-alpha01/tracing-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/transition/transition/1.5.0-alpha01/transition-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha03/vectordrawable-1.2.0-alpha03.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/webkit/webkit/1.5.0-alpha01/webkit-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/work/work-runtime/2.7.0-alpha02/work-runtime-2.7.0-alpha02.aar" "/current/androidx/m2repository/androidx/work/work-runtime-ktx/2.7.0-alpha02/work-runtime-ktx-2.7.0-alpha02.aar" "/current/androidx/manifests/androidx.activity_activity/AndroidManifest.xml" "/current/androidx/manifests/androidx.activity_activity-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.annotation_annotation-experimental/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml" "/current/androidx/manifests/androidx.arch.core_core-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml" "/current/androidx/manifests/androidx.autofill_autofill/AndroidManifest.xml" "/current/androidx/manifests/androidx.cardview_cardview/AndroidManifest.xml" "/current/androidx/manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml" "/current/androidx/manifests/androidx.customview_customview/AndroidManifest.xml" "/current/androidx/manifests/androidx.documentfile_documentfile/AndroidManifest.xml" "/current/androidx/manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml" "/current/androidx/manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.interpolator_interpolator/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback-preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.loader_loader/AndroidManifest.xml" "/current/androidx/manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml" "/current/androidx/manifests/androidx.media_media/AndroidManifest.xml" "/current/androidx/manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.palette_palette/AndroidManifest.xml" "/current/androidx/manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.preference_preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.print_print/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml" "/current/androidx/manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml" "/current/androidx/manifests/androidx.room_room-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-builders/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-view/AndroidManifest.xml" "/current/androidx/manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml" "/current/androidx/manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.tracing_tracing/AndroidManifest.xml" "/current/androidx/manifests/androidx.transition_transition/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml" "/current/androidx/manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager_viewpager/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime-ktx/AndroidManifest.xml" "/current/extras/app-toolkit/m2repository/android/arch/core/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/core/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/livedata-core/28.0.0/livedata-core-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/viewmodel/28.0.0/viewmodel-28.0.0.aar" "/current/extras/app-toolkit/manifests/android-arch-core-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-livedata-core/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-viewmodel/AndroidManifest.xml" "/current/extras/constraint-layout-x/constraintlayout/2.0.0-beta7/constraintlayout-2.0.0-beta7.aar" "/current/extras/constraint-layout-x/constraintlayout-solver/2.0.0-beta7/constraintlayout-solver-2.0.0-beta7.jar" "/current/extras/constraint-layout-x/manifests/androidx-constraintlayout_constraintlayout/AndroidManifest.xml" "/current/extras/material-design/design/com/android/support/design/28.0.0/design-28.0.0.aar" "/current/extras/material-design/manifests/android-support-design/AndroidManifest.xml" "/current/extras/material-design-x/com/google/android/material/material/1.4.0/material-1.4.0.aar" "/current/extras/material-design-x/manifests/com.google.android.material_material/AndroidManifest.xml" "/current/public/android.jar" "/current/support/m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar" "/current/support/m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar" "/current/support/m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar" "/current/support/m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar" "/current/support/m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar" "/current/support/m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar" "/current/support/m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar" "/current/support/m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar" "/current/support/m2repository/com/android/support/print/28.0.0/print-28.0.0.aar" "/current/support/m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar" "/current/support/m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar" "/current/support/m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar" "/current/support/m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar" "/current/support/m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar" "/current/support/m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar" "/current/support/m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar" "/current/support/m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar" "/current/support/m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar" "/current/support/manifests/android-support-animatedvectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-asynclayoutinflater/AndroidManifest.xml" "/current/support/manifests/android-support-compat/AndroidManifest.xml" "/current/support/manifests/android-support-coordinatorlayout/AndroidManifest.xml" "/current/support/manifests/android-support-core-ui/AndroidManifest.xml" "/current/support/manifests/android-support-core-utils/AndroidManifest.xml" "/current/support/manifests/android-support-cursoradapter/AndroidManifest.xml" "/current/support/manifests/android-support-customview/AndroidManifest.xml" "/current/support/manifests/android-support-documentfile/AndroidManifest.xml" "/current/support/manifests/android-support-drawerlayout/AndroidManifest.xml" "/current/support/manifests/android-support-dynamic-animation/AndroidManifest.xml" "/current/support/manifests/android-support-fragment/AndroidManifest.xml" "/current/support/manifests/android-support-interpolator/AndroidManifest.xml" "/current/support/manifests/android-support-loader/AndroidManifest.xml" "/current/support/manifests/android-support-localbroadcastmanager/AndroidManifest.xml" "/current/support/manifests/android-support-media-compat/AndroidManifest.xml" "/current/support/manifests/android-support-print/AndroidManifest.xml" "/current/support/manifests/android-support-slidingpanelayout/AndroidManifest.xml" "/current/support/manifests/android-support-swiperefreshlayout/AndroidManifest.xml" "/current/support/manifests/android-support-transition/AndroidManifest.xml" "/current/support/manifests/android-support-v13/AndroidManifest.xml" "/current/support/manifests/android-support-v4/AndroidManifest.xml" "/current/support/manifests/android-support-v7-appcompat/AndroidManifest.xml" "/current/support/manifests/android-support-v7-cardview/AndroidManifest.xml" "/current/support/manifests/android-support-v7-recyclerview/AndroidManifest.xml" "/current/support/manifests/android-support-vectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-viewpager/AndroidManifest.xml" "/current/support/manifests/android-versionedparcelable/AndroidManifest.xml" "/current/system/android.jar" "/current/system/android.net.ipsec.ike.jar" "/tools/core-lambda-stubs.jar" "/tools/linux/lib64/libclang_android.so" "/tools/linux/lib64/libLLVM_android.so"
clone_project platform/prebuilts/tools prebuilts/tools android12-gsi "/common/m2/repository/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar" "/common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110/symbol-processing-api-1.4.10-dev-experimental-20201110.jar" "/common/m2/repository/com/google/guava/guava/23.0/guava-23.0.jar" "/common/m2/repository/com/google/guava/guava/listenablefuture/1.0/listenablefuture-1.0.jar" "/common/m2/repository/commons-codec/commons-codec/1.10/commons-codec-1.10.jar" "/common/m2/repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar" "/common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041/jaxb-api-2.2.12-b140109.1041.jar" "/common/m2/repository/org/jetbrains/annotations/13.0/annotations-13.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0/kotlinx-coroutines-android-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0/kotlinx-coroutines-core-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0/kotlinx-metadata-jvm-0.1.0.jar" "/common/m2/repository/org/jetbrains/trove4j/trove4j/20160824/trove4j-20160824.jar" "/common/m2/repository/org/ow2/asm/asm/6.1.1/asm-6.1.1.jar" "/common/m2/repository/org/ow2/asm/asm-tree/6.1.1/asm-tree-6.1.1.jar" "/common/m2/repository/org/xerial/sqlite-jdbc/3.28.0/sqlite-jdbc-3.28.0.jar"
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
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/signapk/signapk^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/run_with_timeout/run_with_timeout^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/apache-http/org.apache.http.legacy^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4j/icu4j_calendar_astronomer^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/junit/junit^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lottie/lottie^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/xz-java/xz-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/cmds/idmap2/overlayable_policy_aidl-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/java/statslog-framework-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/sysprop/com.android.sysprop.watchdog^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/errorprone/error_prone_android_framework_lib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/WindowManager/Shell/WindowManager-Shell^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/location/lib/com.android.location.provider^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/InputDevices/validate_input_devices_keymaps^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/ActionBarShadow/SettingsLibActionBarShadow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/ActionButtonsPreference/SettingsLibActionButtonsPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/AdaptiveIcon/SettingsLibAdaptiveIcon^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsLib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/AppPreference/SettingsLibAppPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/BannerMessagePreference/SettingsLibBannerMessagePreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/BarChartPreference/SettingsLibBarChartPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/CollapsingToolbarBaseActivity/SettingsLibCollapsingToolbarBaseActivity^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/DisplayDensityUtils/SettingsLibDisplayDensityUtils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/EmergencyNumber/SettingsLibEmergencyNumber^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/EntityHeaderWidgets/SettingsLibEntityHeaderWidgets^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/FooterPreference/SettingsLibFooterPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/HelpUtils/SettingsLibHelpUtils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/IllustrationPreference/SettingsLibIllustrationPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/LayoutPreference/SettingsLibLayoutPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/MainSwitchPreference/SettingsLibMainSwitchPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/ProgressBar/SettingsLibProgressBar^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/RadioButtonPreference/SettingsLibRadioButtonPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/RestrictedLockUtils/SettingsLibRestrictedLockUtils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SearchWidget/SettingsLibSearchWidget^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsSpinner/SettingsLibSettingsSpinner^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsTheme/SettingsLibSettingsTheme^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsTransition/SettingsLibSettingsTransition^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/Tile/SettingsLibTile^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/TopIntroPreference/SettingsLibTopIntroPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/TwoTargetPreference/SettingsLibTwoTargetPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/UsageProgressBarPreference/SettingsLibUsageProgressBarPreference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/Utils/SettingsLibUtils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SystemUI/SystemUI-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SystemUI/animation/SystemUIAnimationLib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SystemUI/shared/SystemUISharedLib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/services.core.protologsrc^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/statslog-art-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/java/com/android/server/speech/services.speech^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/platform-compat-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/platform-compat-overrides^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/display-device-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/display-layout-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/core/xsd/device-state-config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/coverage/services.coverage^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/net/services.net^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/services/wifi/services.wifi^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/test-base/android.test.base^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt/aapt^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/locked_region_code_injection/lockedregioncodeinjection^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/ex/camera2/extensions/sample/androidx.camera.extensions.impl^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/ex/camera2/extensions/stub/androidx.camera.extensions.stub^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/client-libs/netd-client^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/iconloaderlib/iconloader_base^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/iconloaderlib/iconloader^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/ims-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/libs/WifiTrackerLib/WifiTrackerLib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/setupwizard/library/setup-wizard-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/telephony-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/service/service-permission.stubs.system_server^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/r8-compat-proguard^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.lifecycle_lifecycle-extensions-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v4^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.lifecycle_lifecycle-extensions^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-preference-v14^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.exifinterface_exifinterface-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.exifinterface_exifinterface^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.leanback_leanback-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.leanback_leanback^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-process-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-process^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-service-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-service^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.media_media-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.media_media^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.mediarouter_mediarouter-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.mediarouter_mediarouter^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.palette_palette-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.palette_palette^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.print_print^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.remotecallback_remotecallback-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.remotecallback_remotecallback^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.room_room-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.room_room-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-builders-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-builders^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-view-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slice_slice-view^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slidingpanelayout_slidingpanelayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.slidingpanelayout_slidingpanelayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite-framework-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite-framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.swiperefreshlayout_swiperefreshlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.swiperefreshlayout_swiperefreshlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.work_work-runtime-ktx-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.work_work-runtime-ktx^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.work_work-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.work_work-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.asynclayoutinflater_asynclayoutinflater-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.asynclayoutinflater_asynclayoutinflater^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-livedata-core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-livedata-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-viewmodel-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-viewmodel^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-coordinatorlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-coordinatorlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-cursoradapter-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-cursoradapter^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-customview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-customview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-documentfile-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-documentfile^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-drawerlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-drawerlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-interpolator-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-interpolator^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-loader-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-loader^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-localbroadcastmanager-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-localbroadcastmanager^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-print-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-print^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-v7-recyclerview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-v7-recyclerview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-slidingpanelayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-slidingpanelayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-annotations^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-compat-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-compat^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-core-ui-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-core-ui^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-core-utils-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-core-utils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-fragment-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-fragment^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-media-compat-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-media-compat^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-asynclayoutinflater-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-swiperefreshlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-swiperefreshlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-asynclayoutinflater^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-versionedparcelable-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-versionedparcelable^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-viewpager-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-viewpager^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/kotlinx-coroutines-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/timezone/distro/core/time_zone_distro^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/timezone/distro/installer/time_zone_distro_installer^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/app-compat-annotations^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/changeid/compat-changeid-annotation-processor^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .

echo "building service-blobstore^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja service-blobstore,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/service-blobstore^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/service-blobstore^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/blobstore/service/service-blobstore^android_common/addition_copy_files.output

echo "building service-jobscheduler^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja service-jobscheduler,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/service-jobscheduler^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/service-jobscheduler^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/jobscheduler/service/service-jobscheduler^android_common/addition_copy_files.output

echo "building BluetoothMidiService^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja BluetoothMidiService,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/BluetoothMidiService^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/BluetoothMidiService^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common/addition_copy_files.output

echo "building BackupRestoreConfirmation^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja BackupRestoreConfirmation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/BackupRestoreConfirmation^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/BackupRestoreConfirmation^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common/addition_copy_files.output

echo "building CarrierDefaultApp^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja CarrierDefaultApp,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CarrierDefaultApp^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CarrierDefaultApp^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common/addition_copy_files.output

echo "building CompanionDeviceManager^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja CompanionDeviceManager,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CompanionDeviceManager^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CompanionDeviceManager^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common/addition_copy_files.output

echo "building DynamicSystemInstallationService^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja DynamicSystemInstallationService,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/DynamicSystemInstallationService^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/DynamicSystemInstallationService^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common/addition_copy_files.output

echo "building EasterEgg^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja EasterEgg,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/EasterEgg/EasterEgg^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/EasterEgg^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/EasterEgg/EasterEgg^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/EasterEgg^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/EasterEgg/EasterEgg^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/EasterEgg/EasterEgg^android_common/addition_copy_files.output

echo "building ExtShared^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja ExtShared,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExtShared/ExtShared^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ExtShared^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExtShared/ExtShared^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ExtShared^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExtShared/ExtShared^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExtShared/ExtShared^android_common/addition_copy_files.output

echo "building ExternalStorageProvider^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja ExternalStorageProvider,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ExternalStorageProvider^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ExternalStorageProvider^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common/addition_copy_files.output

echo "building FusedLocation^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja FusedLocation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/FusedLocation/FusedLocation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/FusedLocation^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/FusedLocation/FusedLocation^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/FusedLocation^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/FusedLocation/FusedLocation^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/FusedLocation/FusedLocation^android_common/addition_copy_files.output

echo "building InputDevices^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja InputDevices,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/InputDevices/InputDevices^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/InputDevices^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/InputDevices/InputDevices^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/InputDevices^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/InputDevices/InputDevices^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/InputDevices/InputDevices^android_common/addition_copy_files.output

echo "building LocalTransport^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja LocalTransport,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/LocalTransport/LocalTransport^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/LocalTransport^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/LocalTransport/LocalTransport^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/LocalTransport^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/LocalTransport/LocalTransport^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/LocalTransport/LocalTransport^android_common/addition_copy_files.output

echo "building PackageInstaller^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja PackageInstaller,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PackageInstaller^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PackageInstaller^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common/addition_copy_files.output

echo "building PrintRecommendationService^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja PrintRecommendationService,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PrintRecommendationService^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PrintRecommendationService^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common/addition_copy_files.output

echo "building PrintSpooler^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja PrintSpooler,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PrintSpooler^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PrintSpooler^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common/addition_copy_files.output

echo "building SettingsProvider^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja SettingsProvider,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SettingsProvider^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SettingsProvider^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common/addition_copy_files.output

echo "building SharedStorageBackup^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja SharedStorageBackup,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SharedStorageBackup^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SharedStorageBackup^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common/addition_copy_files.output

echo "building Shell^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja Shell,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/Shell/Shell^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/Shell^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/Shell/Shell^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/Shell^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/Shell/Shell^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/Shell/Shell^android_common/addition_copy_files.output

echo "building SimAppDialog^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja SimAppDialog,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SimAppDialog^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SimAppDialog^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common/addition_copy_files.output

echo "building SoundPicker^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja SoundPicker,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SoundPicker/SoundPicker^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SoundPicker^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SoundPicker/SoundPicker^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SoundPicker^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SoundPicker/SoundPicker^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SoundPicker/SoundPicker^android_common/addition_copy_files.output

echo "building StatementService^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja StatementService,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/StatementService/StatementService^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/StatementService^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/StatementService/StatementService^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/StatementService^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/StatementService/StatementService^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/StatementService/StatementService^android_common/addition_copy_files.output

echo "building SystemUI^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja SystemUI,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SystemUI^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/SystemUI^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI^android_common/addition_copy_files.output

echo "building VpnDialogs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja VpnDialogs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/VpnDialogs^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/VpnDialogs^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common/addition_copy_files.output

echo "building WallpaperBackup^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja WallpaperBackup,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/WallpaperBackup^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/WallpaperBackup^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common/addition_copy_files.output

echo "building WallpaperCropper^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja WallpaperCropper,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/WallpaperCropper^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/WallpaperCropper^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common/addition_copy_files.output

echo "building CameraExtensionsProxy^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja CameraExtensionsProxy,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CameraExtensionsProxy^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/CameraExtensionsProxy^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common/addition_copy_files.output

echo "building PacProcessor^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja PacProcessor,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PacProcessor^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/PacProcessor^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common/addition_copy_files.output

echo "building ProxyHandler^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja ProxyHandler,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/Proxy/ProxyHandler^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ProxyHandler^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/Proxy/ProxyHandler^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/ProxyHandler^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/Proxy/ProxyHandler^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/services/Proxy/ProxyHandler^android_common/addition_copy_files.output

echo "building services-platform-compat-config^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services-platform-compat-config,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services-platform-compat-config^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services-platform-compat-config^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-platform-compat-config^android_common/addition_copy_files.output

echo "building services^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services^android_common/addition_copy_files.output

echo "building services.accessibility^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.accessibility,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.accessibility^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.accessibility^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/accessibility/services.accessibility^android_common/addition_copy_files.output

echo "building services.appprediction^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.appprediction,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.appprediction^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.appprediction^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appprediction/services.appprediction^android_common/addition_copy_files.output

echo "building services.appwidget^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.appwidget,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.appwidget^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.appwidget^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/appwidget/services.appwidget^android_common/addition_copy_files.output

echo "building services.autofill^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.autofill,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.autofill^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.autofill^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/autofill/services.autofill^android_common/addition_copy_files.output

echo "building services.backup^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.backup,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.backup^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.backup^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/services.backup^android_common/addition_copy_files.output

echo "building backuplib^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja backuplib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/backuplib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/backuplib^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/backup/backuplib/backuplib^android_common/addition_copy_files.output

echo "building services.companion^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.companion,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.companion^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.companion^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/companion/services.companion^android_common/addition_copy_files.output

echo "building services.contentcapture^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.contentcapture,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.contentcapture^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.contentcapture^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentcapture/services.contentcapture^android_common/addition_copy_files.output

echo "building services.contentsuggestions^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.contentsuggestions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.contentsuggestions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.contentsuggestions^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/contentsuggestions/services.contentsuggestions^android_common/addition_copy_files.output

echo "building services.core.priorityboosted^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.core.priorityboosted,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core.priorityboosted^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core.priorityboosted^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.priorityboosted^android_common/addition_copy_files.output

echo "building services.core^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.core,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core^android_common/addition_copy_files.output

echo "building services.core.unboosted^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.core.unboosted,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core.unboosted^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.core.unboosted^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.unboosted^android_common/addition_copy_files.output

echo "building services.devicepolicy^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.devicepolicy,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.devicepolicy^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.devicepolicy^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/devicepolicy/services.devicepolicy^android_common/addition_copy_files.output

echo "building services.midi^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.midi,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.midi^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.midi^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/midi/services.midi^android_common/addition_copy_files.output

echo "building services.musicsearch^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.musicsearch,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.musicsearch^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.musicsearch^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/musicrecognition/services.musicsearch^android_common/addition_copy_files.output

echo "building services.people^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.people,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.people^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.people^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/people/services.people^android_common/addition_copy_files.output

echo "building services.print^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.print,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.print^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.print^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/print/services.print^android_common/addition_copy_files.output

echo "building services.profcollect^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.profcollect,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.profcollect^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.profcollect^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/profcollect/services.profcollect^android_common/addition_copy_files.output

echo "building services.restrictions^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.restrictions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.restrictions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.restrictions^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/restrictions/services.restrictions^android_common/addition_copy_files.output

echo "building services.searchui^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.searchui,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.searchui^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.searchui^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/searchui/services.searchui^android_common/addition_copy_files.output

echo "building services.smartspace^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.smartspace,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.smartspace^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.smartspace^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/smartspace/services.smartspace^android_common/addition_copy_files.output

echo "building services.startop^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.startop,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.startop^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.startop^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/startop/services.startop^android_common/addition_copy_files.output

echo "building services.systemcaptions^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.systemcaptions,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.systemcaptions^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.systemcaptions^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/systemcaptions/services.systemcaptions^android_common/addition_copy_files.output

echo "building services.texttospeech^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.texttospeech,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.texttospeech^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.texttospeech^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/texttospeech/services.texttospeech^android_common/addition_copy_files.output

echo "building services.translation^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.translation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.translation^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.translation^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/translation/services.translation^android_common/addition_copy_files.output

echo "building services.usage^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.usage,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.usage^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.usage^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usage/services.usage^android_common/addition_copy_files.output

echo "building services.usb^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.usb,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.usb^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.usb^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/usb/services.usb^android_common/addition_copy_files.output

echo "building services.uwb^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.uwb,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.uwb^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.uwb^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/uwb/services.uwb^android_common/addition_copy_files.output

echo "building services.voiceinteraction^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.voiceinteraction,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.voiceinteraction^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.voiceinteraction^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/services/voiceinteraction/services.voiceinteraction^android_common/addition_copy_files.output

echo "building services.startop.iorap^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_32.ninja services.startop.iorap,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.startop.iorap^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_32/frameworks/base/services.startop.iorap^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/startop/iorap/services.startop.iorap^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_32 frameworks_base.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-http.tar.zst" ]; then
  echo "Compressing external/apache-http -> external_apache-http.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_apache-http.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/apache-http/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_junit.tar.zst" ]; then
  echo "Compressing external/junit -> external_junit.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/junit/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lottie.tar.zst" ]; then
  echo "Compressing external/lottie -> external_lottie.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lottie.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lottie/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_xz-java.tar.zst" ]; then
  echo "Compressing external/xz-java -> external_xz-java.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_xz-java.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/xz-java/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst" ]; then
  echo "Compressing frameworks/ex -> frameworks_ex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/ex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_systemui.tar.zst" ]; then
  echo "Compressing frameworks/libs/systemui -> frameworks_libs_systemui.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_systemui.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/systemui/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/ims -> frameworks_opt_net_ims.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/ims/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_wifi.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/wifi -> frameworks_opt_net_wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/wifi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_setupwizard.tar.zst" ]; then
  echo "Compressing frameworks/opt/setupwizard -> frameworks_opt_setupwizard.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_setupwizard.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/setupwizard/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst" ]; then
  echo "Compressing frameworks/opt/telephony -> frameworks_opt_telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/telephony/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
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
