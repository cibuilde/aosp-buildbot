set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform build/soong
clone_depth_platform platform/prebuilts/sdk
clone_project platform/prebuilts/sdk prebuilts/sdk android12-gsi "/14/public/android.jar" "/15/public/android.jar" "/16/public/android.jar" "/17/public/android.jar" "/21/public/android.jar" "/28/public/android.jar" "/28/public/org.apache.http.legacy.jar" "/29/public/android.jar" "/29/system/android.jar" "/30/module-lib/android.jar" "/30/public/android.jar" "/30/public/core-for-system-modules.jar" "/30/system/android.jar" "/31/module-lib/android.jar" "/31/module-lib/api/android.net.ipsec.ike-removed.txt" "/31/module-lib/api/android.net.ipsec.ike.txt" "/31/module-lib/api/android-non-updatable-removed.txt" "/31/module-lib/api/android-non-updatable.txt" "/31/module-lib/api/android.txt" "/31/module-lib/api/art-removed.txt" "/31/module-lib/api/art.txt" "/31/module-lib/api/framework-connectivity-removed.txt" "/31/module-lib/api/framework-connectivity.txt" "/31/module-lib/api/framework-mediaprovider-removed.txt" "/31/module-lib/api/framework-mediaprovider.txt" "/31/module-lib/api/framework-media-removed.txt" "/31/module-lib/api/framework-media.txt" "/31/module-lib/api/framework-permission-removed.txt" "/31/module-lib/api/framework-permission-s-removed.txt" "/31/module-lib/api/framework-permission-s.txt" "/31/module-lib/api/framework-permission.txt" "/31/module-lib/api/framework-scheduling-removed.txt" "/31/module-lib/api/framework-scheduling.txt" "/31/module-lib/api/framework-sdkextensions-removed.txt" "/31/module-lib/api/framework-sdkextensions.txt" "/31/module-lib/api/framework-statsd-removed.txt" "/31/module-lib/api/framework-statsd.txt" "/31/module-lib/api/framework-tethering-removed.txt" "/31/module-lib/api/framework-tethering.txt" "/31/module-lib/api/framework-wifi-removed.txt" "/31/module-lib/api/framework-wifi.txt" "/31/module-lib/framework-connectivity.jar" "/31/module-lib/framework-statsd.jar" "/31/module-lib/framework-wifi.jar" "/31/public/api/android.net.ipsec.ike-removed.txt" "/31/public/api/android.net.ipsec.ike.txt" "/31/public/api/android-non-updatable-incompatibilities.txt" "/31/public/api/android-non-updatable-removed.txt" "/31/public/api/android-non-updatable.txt" "/31/public/api/android.txt" "/31/public/api/art-removed.txt" "/31/public/api/art.txt" "/31/public/api/conscrypt-removed.txt" "/31/public/api/conscrypt.txt" "/31/public/api/framework-connectivity-removed.txt" "/31/public/api/framework-connectivity.txt" "/31/public/api/framework-mediaprovider-removed.txt" "/31/public/api/framework-mediaprovider.txt" "/31/public/api/framework-media-removed.txt" "/31/public/api/framework-media.txt" "/31/public/api/framework-permission-removed.txt" "/31/public/api/framework-permission-s-removed.txt" "/31/public/api/framework-permission-s.txt" "/31/public/api/framework-permission.txt" "/31/public/api/framework-scheduling-removed.txt" "/31/public/api/framework-scheduling.txt" "/31/public/api/framework-sdkextensions-removed.txt" "/31/public/api/framework-sdkextensions.txt" "/31/public/api/framework-statsd-removed.txt" "/31/public/api/framework-statsd.txt" "/31/public/api/framework-tethering-removed.txt" "/31/public/api/framework-tethering.txt" "/31/public/api/framework-wifi-removed.txt" "/31/public/api/framework-wifi.txt" "/31/public/api/org.apache.http.legacy-removed.txt" "/31/public/api/org.apache.http.legacy.txt" "/31/public/api/runtime-i18n-removed.txt" "/31/public/api/runtime-i18n.txt" "/31/public/core-for-system-modules.jar" "/31/system/api/android.net.ipsec.ike-incompatibilities.txt" "/31/system/api/android.net.ipsec.ike-removed.txt" "/31/system/api/android.net.ipsec.ike.txt" "/31/system/api/android-non-updatable-incompatibilities.txt" "/31/system/api/android-non-updatable-removed.txt" "/31/system/api/android-non-updatable.txt" "/31/system/api/android.test.base-removed.txt" "/31/system/api/android.test.base.txt" "/31/system/api/android.test.mock-removed.txt" "/31/system/api/android.test.mock.txt" "/31/system/api/android.test.runner-removed.txt" "/31/system/api/android.test.runner.txt" "/31/system/api/android.txt" "/31/system/api/art-removed.txt" "/31/system/api/art.txt" "/31/system/api/framework-connectivity-removed.txt" "/31/system/api/framework-connectivity.txt" "/31/system/api/framework-mediaprovider-removed.txt" "/31/system/api/framework-mediaprovider.txt" "/31/system/api/framework-media-removed.txt" "/31/system/api/framework-media.txt" "/31/system/api/framework-permission-removed.txt" "/31/system/api/framework-permission-s-removed.txt" "/31/system/api/framework-permission-s.txt" "/31/system/api/framework-permission.txt" "/31/system/api/framework-scheduling-removed.txt" "/31/system/api/framework-scheduling.txt" "/31/system/api/framework-sdkextensions-removed.txt" "/31/system/api/framework-sdkextensions.txt" "/31/system/api/framework-statsd-removed.txt" "/31/system/api/framework-statsd.txt" "/31/system/api/framework-tethering-removed.txt" "/31/system/api/framework-tethering.txt" "/31/system/api/framework-wifi-removed.txt" "/31/system/api/framework-wifi.txt" "/31/system/api/org.apache.http.legacy-removed.txt" "/31/system/api/org.apache.http.legacy.txt" "/31/system-server/api/android-non-updatable.txt" "/31/system-server/api/service-permission-removed.txt" "/31/system-server/api/service-permission.txt" "/8/public/android.jar" "/9/public/android.jar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar" "/current/androidx-legacy/manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml" "/current/androidx/m2repository/androidx/activity/activity/1.3.0-alpha03/activity-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/activity/activity-ktx/1.3.0-alpha03/activity-ktx-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/annotation/annotation/1.3.0-alpha01/annotation-1.3.0-alpha01.jar" "/current/androidx/m2repository/androidx/annotation/annotation-experimental/1.2.0-alpha01/annotation-experimental-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat/1.3.0-beta02/appcompat-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat-resources/1.3.0-beta02/appcompat-resources-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/autofill/autofill/1.2.0-alpha01/autofill-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/collection/collection/1.2.0-alpha02/collection-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/collection/collection-ktx/1.2.0-alpha02/collection-ktx-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/concurrent/concurrent-futures/1.2.0-alpha01/concurrent-futures-1.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/core/core/1.6.0-beta03/core-1.6.0-beta03.aar" "/current/androidx/m2repository/androidx/core/core-ktx/1.5.0-beta02/core-ktx-1.5.0-beta02.aar" "/current/androidx/m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar" "/current/androidx/m2repository/androidx/exifinterface/exifinterface/1.4.0-alpha01/exifinterface-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment/1.4.0-alpha01/fragment-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment-ktx/1.4.0-alpha01/fragment-ktx-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/leanback/leanback/1.1.0-beta01/leanback-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/leanback/leanback-preference/1.1.0-beta01/leanback-preference-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common/2.4.0-alpha01/lifecycle-common-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common-java8/2.4.0-alpha01/lifecycle-common-java8-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata/2.4.0-alpha01/lifecycle-livedata-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core/2.4.0-alpha01/lifecycle-livedata-core-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.4.0-alpha01/lifecycle-livedata-core-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-process/2.4.0-alpha01/lifecycle-process-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime/2.4.0-alpha01/lifecycle-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.4.0-alpha01/lifecycle-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-service/2.4.0-alpha01/lifecycle-service-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel/2.4.0-alpha01/lifecycle-viewmodel-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.4.0-alpha01/lifecycle-viewmodel-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.4.0-alpha01/lifecycle-viewmodel-savedstate-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/media/media/1.3.0-beta01/media-1.3.0-beta01.aar" "/current/androidx/m2repository/androidx/mediarouter/mediarouter/1.3.0-alpha01/mediarouter-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/print/print/1.1.0-beta01/print-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview/1.3.0-alpha01/recyclerview-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar" "/current/androidx/m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar" "/current/androidx/m2repository/androidx/room/room-common/2.3.0-beta02/room-common-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler/2.3.0-beta02/room-compiler-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler-processing/2.3.0-beta02/room-compiler-processing-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-migration/2.3.0-beta02/room-migration-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-runtime/2.3.0-beta02/room-runtime-2.3.0-beta02.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate/1.2.0-alpha01/savedstate-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate-ktx/1.2.0-alpha01/savedstate-ktx-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite/2.2.0-alpha01/sqlite-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite-framework/2.2.0-alpha01/sqlite-framework-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.2.0-alpha01/swiperefreshlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/tracing/tracing/1.1.0-alpha01/tracing-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/transition/transition/1.5.0-alpha01/transition-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha03/vectordrawable-1.2.0-alpha03.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/webkit/webkit/1.5.0-alpha01/webkit-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/work/work-runtime/2.7.0-alpha02/work-runtime-2.7.0-alpha02.aar" "/current/androidx/m2repository/androidx/work/work-runtime-ktx/2.7.0-alpha02/work-runtime-ktx-2.7.0-alpha02.aar" "/current/androidx/manifests/androidx.activity_activity/AndroidManifest.xml" "/current/androidx/manifests/androidx.activity_activity-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.annotation_annotation-experimental/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml" "/current/androidx/manifests/androidx.arch.core_core-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml" "/current/androidx/manifests/androidx.autofill_autofill/AndroidManifest.xml" "/current/androidx/manifests/androidx.cardview_cardview/AndroidManifest.xml" "/current/androidx/manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml" "/current/androidx/manifests/androidx.customview_customview/AndroidManifest.xml" "/current/androidx/manifests/androidx.documentfile_documentfile/AndroidManifest.xml" "/current/androidx/manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml" "/current/androidx/manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.interpolator_interpolator/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback-preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.loader_loader/AndroidManifest.xml" "/current/androidx/manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml" "/current/androidx/manifests/androidx.media_media/AndroidManifest.xml" "/current/androidx/manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.palette_palette/AndroidManifest.xml" "/current/androidx/manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.preference_preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.print_print/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml" "/current/androidx/manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml" "/current/androidx/manifests/androidx.room_room-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-builders/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-view/AndroidManifest.xml" "/current/androidx/manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml" "/current/androidx/manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.tracing_tracing/AndroidManifest.xml" "/current/androidx/manifests/androidx.transition_transition/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml" "/current/androidx/manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager_viewpager/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime-ktx/AndroidManifest.xml" "/current/extras/app-toolkit/m2repository/android/arch/core/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/core/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/livedata-core/28.0.0/livedata-core-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/viewmodel/28.0.0/viewmodel-28.0.0.aar" "/current/extras/app-toolkit/manifests/android-arch-core-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-livedata-core/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-viewmodel/AndroidManifest.xml" "/current/extras/constraint-layout-x/constraintlayout/2.0.0-beta7/constraintlayout-2.0.0-beta7.aar" "/current/extras/constraint-layout-x/constraintlayout-solver/2.0.0-beta7/constraintlayout-solver-2.0.0-beta7.jar" "/current/extras/constraint-layout-x/manifests/androidx-constraintlayout_constraintlayout/AndroidManifest.xml" "/current/extras/material-design/design/com/android/support/design/28.0.0/design-28.0.0.aar" "/current/extras/material-design/manifests/android-support-design/AndroidManifest.xml" "/current/extras/material-design-x/com/google/android/material/material/1.4.0/material-1.4.0.aar" "/current/extras/material-design-x/manifests/com.google.android.material_material/AndroidManifest.xml" "/current/public/android.jar" "/current/support/m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar" "/current/support/m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar" "/current/support/m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar" "/current/support/m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar" "/current/support/m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar" "/current/support/m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar" "/current/support/m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar" "/current/support/m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar" "/current/support/m2repository/com/android/support/print/28.0.0/print-28.0.0.aar" "/current/support/m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar" "/current/support/m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar" "/current/support/m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar" "/current/support/m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar" "/current/support/m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar" "/current/support/m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar" "/current/support/m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar" "/current/support/m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar" "/current/support/m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar" "/current/support/manifests/android-support-animatedvectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-asynclayoutinflater/AndroidManifest.xml" "/current/support/manifests/android-support-compat/AndroidManifest.xml" "/current/support/manifests/android-support-coordinatorlayout/AndroidManifest.xml" "/current/support/manifests/android-support-core-ui/AndroidManifest.xml" "/current/support/manifests/android-support-core-utils/AndroidManifest.xml" "/current/support/manifests/android-support-cursoradapter/AndroidManifest.xml" "/current/support/manifests/android-support-customview/AndroidManifest.xml" "/current/support/manifests/android-support-documentfile/AndroidManifest.xml" "/current/support/manifests/android-support-drawerlayout/AndroidManifest.xml" "/current/support/manifests/android-support-dynamic-animation/AndroidManifest.xml" "/current/support/manifests/android-support-fragment/AndroidManifest.xml" "/current/support/manifests/android-support-interpolator/AndroidManifest.xml" "/current/support/manifests/android-support-loader/AndroidManifest.xml" "/current/support/manifests/android-support-localbroadcastmanager/AndroidManifest.xml" "/current/support/manifests/android-support-media-compat/AndroidManifest.xml" "/current/support/manifests/android-support-print/AndroidManifest.xml" "/current/support/manifests/android-support-slidingpanelayout/AndroidManifest.xml" "/current/support/manifests/android-support-swiperefreshlayout/AndroidManifest.xml" "/current/support/manifests/android-support-transition/AndroidManifest.xml" "/current/support/manifests/android-support-v13/AndroidManifest.xml" "/current/support/manifests/android-support-v4/AndroidManifest.xml" "/current/support/manifests/android-support-v7-appcompat/AndroidManifest.xml" "/current/support/manifests/android-support-v7-cardview/AndroidManifest.xml" "/current/support/manifests/android-support-v7-recyclerview/AndroidManifest.xml" "/current/support/manifests/android-support-vectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-viewpager/AndroidManifest.xml" "/current/support/manifests/android-versionedparcelable/AndroidManifest.xml" "/current/system/android.jar" "/current/system/android.net.ipsec.ike.jar" "/tools/core-lambda-stubs.jar" "/tools/linux/lib64/libclang_android.so" "/tools/linux/lib64/libLLVM_android.so"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building service-permission.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja service-permission.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/service-permission.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission.api.system-server.latest^

echo "building service-permission-removed.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja service-permission-removed.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-removed.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/service-permission-removed.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-removed.api.system-server.latest^

echo "building service-permission-incompatibilities.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja service-permission-incompatibilities.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/service-permission-incompatibilities.api.system-server.latest^

echo "building runtime-i18n.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja runtime-i18n.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/runtime-i18n.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n.api.public.latest^

echo "building runtime-i18n-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja runtime-i18n-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/runtime-i18n-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-removed.api.public.latest^

echo "building runtime-i18n-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja runtime-i18n-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/runtime-i18n-incompatibilities.api.public.latest^

echo "building prebuilt_libclang_android^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja prebuilt_libclang_android,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libclang_android^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/prebuilt_libclang_android^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libclang_android^linux_glibc_x86_64_shared

echo "building prebuilt_libLLVM_android^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja prebuilt_libLLVM_android,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/prebuilt_libLLVM_android^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared

echo "building org.apache.http.legacy.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.system.latest^

echo "building org.apache.http.legacy.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy.api.public.latest^

echo "building org.apache.http.legacy-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.system.latest^

echo "building org.apache.http.legacy-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-removed.api.public.latest^

echo "building org.apache.http.legacy-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.system.latest^

echo "building org.apache.http.legacy-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja org.apache.http.legacy-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/org.apache.http.legacy-incompatibilities.api.public.latest^

echo "building framework-wifi.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.system.latest^

echo "building framework-wifi.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.public.latest^

echo "building framework-wifi.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi.api.module-lib.latest^

echo "building framework-wifi-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.system.latest^

echo "building framework-wifi-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.public.latest^

echo "building framework-wifi-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-removed.api.module-lib.latest^

echo "building framework-wifi-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.system.latest^

echo "building framework-wifi-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.public.latest^

echo "building framework-wifi-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-wifi-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-wifi-incompatibilities.api.module-lib.latest^

echo "building framework-tethering.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.system.latest^

echo "building framework-tethering.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.public.latest^

echo "building framework-tethering.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering.api.module-lib.latest^

echo "building framework-tethering-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.system.latest^

echo "building framework-tethering-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.public.latest^

echo "building framework-tethering-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-removed.api.module-lib.latest^

echo "building framework-tethering-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.system.latest^

echo "building framework-tethering-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.public.latest^

echo "building framework-tethering-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-tethering-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-tethering-incompatibilities.api.module-lib.latest^

echo "building framework-statsd.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.system.latest^

echo "building framework-statsd.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.public.latest^

echo "building framework-statsd.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd.api.module-lib.latest^

echo "building framework-statsd-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.system.latest^

echo "building framework-statsd-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.public.latest^

echo "building framework-statsd-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-removed.api.module-lib.latest^

echo "building framework-statsd-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.system.latest^

echo "building framework-statsd-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.public.latest^

echo "building framework-statsd-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-statsd-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-statsd-incompatibilities.api.module-lib.latest^

echo "building framework-sdkextensions.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.system.latest^

echo "building framework-sdkextensions.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.public.latest^

echo "building framework-sdkextensions.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions.api.module-lib.latest^

echo "building framework-sdkextensions-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.system.latest^

echo "building framework-sdkextensions-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.public.latest^

echo "building framework-sdkextensions-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-removed.api.module-lib.latest^

echo "building framework-sdkextensions-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.system.latest^

echo "building framework-sdkextensions-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.public.latest^

echo "building framework-sdkextensions-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-sdkextensions-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-sdkextensions-incompatibilities.api.module-lib.latest^

echo "building framework-scheduling.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.system.latest^

echo "building framework-scheduling.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.public.latest^

echo "building framework-scheduling.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling.api.module-lib.latest^

echo "building framework-scheduling-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.system.latest^

echo "building framework-scheduling-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.public.latest^

echo "building framework-scheduling-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-removed.api.module-lib.latest^

echo "building framework-scheduling-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.system.latest^

echo "building framework-scheduling-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.public.latest^

echo "building framework-scheduling-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-scheduling-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-scheduling-incompatibilities.api.module-lib.latest^

echo "building framework-permission.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.system.latest^

echo "building framework-permission.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.public.latest^

echo "building framework-permission.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission.api.module-lib.latest^

echo "building framework-permission-s.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.system.latest^

echo "building framework-permission-s.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.public.latest^

echo "building framework-permission-s.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s.api.module-lib.latest^

echo "building framework-permission-s-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.system.latest^

echo "building framework-permission-s-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.public.latest^

echo "building framework-permission-s-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-removed.api.module-lib.latest^

echo "building framework-permission-s-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.system.latest^

echo "building framework-permission-s-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.public.latest^

echo "building framework-permission-s-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-s-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-s-incompatibilities.api.module-lib.latest^

echo "building framework-permission-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.system.latest^

echo "building framework-permission-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.public.latest^

echo "building framework-permission-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-removed.api.module-lib.latest^

echo "building framework-permission-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.system.latest^

echo "building framework-permission-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.public.latest^

echo "building framework-permission-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-permission-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-permission-incompatibilities.api.module-lib.latest^

echo "building framework-mediaprovider.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.system.latest^

echo "building framework-mediaprovider.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.public.latest^

echo "building framework-mediaprovider.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider.api.module-lib.latest^

echo "building framework-mediaprovider-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.system.latest^

echo "building framework-mediaprovider-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.public.latest^

echo "building framework-mediaprovider-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-removed.api.module-lib.latest^

echo "building framework-mediaprovider-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.system.latest^

echo "building framework-mediaprovider-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.public.latest^

echo "building framework-mediaprovider-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-mediaprovider-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-mediaprovider-incompatibilities.api.module-lib.latest^

echo "building framework-media.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.system.latest^

echo "building framework-media.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.public.latest^

echo "building framework-media.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media.api.module-lib.latest^

echo "building framework-media-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.system.latest^

echo "building framework-media-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.public.latest^

echo "building framework-media-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-removed.api.module-lib.latest^

echo "building framework-media-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.system.latest^

echo "building framework-media-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.public.latest^

echo "building framework-media-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-media-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-media-incompatibilities.api.module-lib.latest^

echo "building framework-connectivity.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.system.latest^

echo "building framework-connectivity.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.public.latest^

echo "building framework-connectivity.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity.api.module-lib.latest^

echo "building framework-connectivity-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.system.latest^

echo "building framework-connectivity-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.public.latest^

echo "building framework-connectivity-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-removed.api.module-lib.latest^

echo "building framework-connectivity-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.system.latest^

echo "building framework-connectivity-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.public.latest^

echo "building framework-connectivity-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja framework-connectivity-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/framework-connectivity-incompatibilities.api.module-lib.latest^

echo "building conscrypt.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja conscrypt.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/conscrypt.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt.api.public.latest^

echo "building conscrypt-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja conscrypt-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/conscrypt-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-removed.api.public.latest^

echo "building conscrypt-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja conscrypt-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/conscrypt-incompatibilities.api.public.latest^

echo "building art.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.system.latest^

echo "building art.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.public.latest^

echo "building art.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art.api.module-lib.latest^

echo "building art-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.system.latest^

echo "building art-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.public.latest^

echo "building art-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-removed.api.module-lib.latest^

echo "building art-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.system.latest^

echo "building art-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.public.latest^

echo "building art-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/art-incompatibilities.api.module-lib.latest^

echo "building androidx.room_room-migration-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-migration-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-migration-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration-nodeps^linux_glibc_common

echo "building androidx.room_room-compiler-processing-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-compiler-processing-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-processing-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-compiler-processing-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-processing-nodeps^linux_glibc_common

echo "building androidx.room_room-compiler-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-compiler-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-compiler-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-nodeps^linux_glibc_common

echo "building androidx.room_room-common-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-common-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-common-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^linux_glibc_common

echo "building androidx.room_room-common^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-common,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-common^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common

echo "building androidx.room_room-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^android_common

echo "building androidx.room_room-common^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.room_room-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.room_room-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^android_common

echo "building androidx.lifecycle_lifecycle-common^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common

echo "building androidx.lifecycle_lifecycle-common^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common

echo "building androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common-java8-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common-java8^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.lifecycle_lifecycle-common-java8,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.lifecycle_lifecycle-common-java8^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8^android_common_apex30

echo "building androidx.concurrent_concurrent-futures-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.concurrent_concurrent-futures-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.concurrent_concurrent-futures-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures-nodeps^android_common

echo "building androidx.collection_collection-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common_apex30

echo "building androidx.collection_collection^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common_apex30

echo "building androidx.collection_collection-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common

echo "building androidx.collection_collection^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common

echo "building androidx.collection_collection-ktx-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection-ktx-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection-ktx-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common_apex30

echo "building androidx.collection_collection-ktx-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.collection_collection-ktx-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.collection_collection-ktx-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common

echo "building androidx.arch.core_core-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.arch.core_core-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.arch.core_core-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common

echo "building androidx.annotation_annotation^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30

echo "building androidx.annotation_annotation^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex29

echo "building androidx.annotation_annotation^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common

echo "building androidx.arch.core_core-common^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.arch.core_core-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.arch.core_core-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common

echo "building androidx.arch.core_core-common-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.arch.core_core-common-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.arch.core_core-common-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common_apex30

echo "building androidx.annotation_annotation-nodeps^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation-nodeps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation-nodeps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^linux_glibc_common

echo "building androidx.annotation_annotation-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30

echo "building androidx.arch.core_core-common^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.arch.core_core-common,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.arch.core_core-common^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common_apex30

echo "building androidx.annotation_annotation-nodeps^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation-nodeps,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex29

echo "building androidx.annotation_annotation-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx.annotation_annotation-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx.annotation_annotation-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common

echo "building androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx-constraintlayout_constraintlayout-solver-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30

echo "building androidx-constraintlayout_constraintlayout-solver^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx-constraintlayout_constraintlayout-solver,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common_apex30

echo "building androidx-constraintlayout_constraintlayout-solver-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx-constraintlayout_constraintlayout-solver-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common

echo "building androidx-constraintlayout_constraintlayout-solver^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja androidx-constraintlayout_constraintlayout-solver,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common

echo "building android.test.runner.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.runner.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.runner.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner.api.system.latest^

echo "building android.test.runner-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.runner-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.runner-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-removed.api.system.latest^

echo "building android.test.runner-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.runner-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^

echo "building android.test.mock.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.mock.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.mock.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock.api.system.latest^

echo "building android.test.mock-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.mock-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.mock-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-removed.api.system.latest^

echo "building android.test.mock-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.mock-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^

echo "building android.test.base.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.base.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.base.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base.api.system.latest^

echo "building android.test.base-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.base-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.base-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-removed.api.system.latest^

echo "building android.test.base-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.test.base-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^

echo "building android.net.ipsec.ike.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.system.latest^

echo "building android.net.ipsec.ike.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.public.latest^

echo "building android.net.ipsec.ike.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike.api.module-lib.latest^

echo "building android.net.ipsec.ike-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.system.latest^

echo "building android.net.ipsec.ike-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.public.latest^

echo "building android.net.ipsec.ike-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-removed.api.module-lib.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.system.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.public.latest^

echo "building android.net.ipsec.ike-incompatibilities.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.net.ipsec.ike-incompatibilities.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.net.ipsec.ike-incompatibilities.api.module-lib.latest^

echo "building android.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.system.latest^

echo "building android.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.public.latest^

echo "building android.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android.api.module-lib.latest^

echo "building android-support-collections-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-support-collections-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-support-collections-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections-nodeps^android_common

echo "building android-support-annotations-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-support-annotations-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-support-annotations-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common

echo "building android-support-annotations^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-support-annotations,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-support-annotations^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations^android_common

echo "building android-support-collections^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-support-collections,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-support-collections^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections^android_common

echo "building android-non-updatable.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system.latest^

echo "building android-non-updatable.api.system-server.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable.api.system-server.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system-server.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable.api.system-server.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.system-server.latest^

echo "building android-non-updatable.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.public.latest^

echo "building android-non-updatable.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable.api.module-lib.latest^

echo "building android-non-updatable-removed.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable-removed.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable-removed.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.system.latest^

echo "building android-non-updatable-removed.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable-removed.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable-removed.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.public.latest^

echo "building android-non-updatable-removed.api.module-lib.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable-removed.api.module-lib.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^

echo "building android-non-updatable-incompatibilities.api.system.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable-incompatibilities.api.system.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^

echo "building android-non-updatable-incompatibilities.api.public.latest^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-non-updatable-incompatibilities.api.public.latest,
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^

echo "building android-arch-lifecycle-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-arch-lifecycle-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-arch-lifecycle-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common-nodeps^android_common

echo "building android-arch-lifecycle-common^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-arch-lifecycle-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-arch-lifecycle-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common^android_common

echo "building android-arch-core-common-nodeps^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-arch-core-common-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-arch-core-common-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common-nodeps^android_common

echo "building android-arch-core-common^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-arch-core-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/prebuilts/sdk/android-arch-core-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_prebuilts_sdk.tar.zst --clobber

du -ah -d1 platform_prebuilts_sdk*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_prebuilts_sdk.tar.zst" ]; then
  echo "Compressing platform/prebuilts/sdk -> platform_prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi

rm -rf aosp
