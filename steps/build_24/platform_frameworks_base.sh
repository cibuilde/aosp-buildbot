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
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/icing
clone_depth_platform external/jsr330
clone_depth_platform external/junit
clone_depth_platform external/kotlinc
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/systemui
clone_depth_platform frameworks/native
clone_depth_platform libcore
clone_depth_platform packages/modules/StatsD
clone_depth_platform platform/frameworks/base
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/sdk prebuilts/sdk android12-gsi "/14/public/android.jar" "/15/public/android.jar" "/16/public/android.jar" "/17/public/android.jar" "/21/public/android.jar" "/28/public/android.jar" "/28/public/org.apache.http.legacy.jar" "/29/public/android.jar" "/29/system/android.jar" "/30/module-lib/android.jar" "/30/public/android.jar" "/30/public/core-for-system-modules.jar" "/30/system/android.jar" "/31/module-lib/android.jar" "/31/module-lib/api/android.net.ipsec.ike-removed.txt" "/31/module-lib/api/android.net.ipsec.ike.txt" "/31/module-lib/api/android-non-updatable-removed.txt" "/31/module-lib/api/android-non-updatable.txt" "/31/module-lib/api/android.txt" "/31/module-lib/api/art-removed.txt" "/31/module-lib/api/art.txt" "/31/module-lib/api/framework-connectivity-removed.txt" "/31/module-lib/api/framework-connectivity.txt" "/31/module-lib/api/framework-mediaprovider-removed.txt" "/31/module-lib/api/framework-mediaprovider.txt" "/31/module-lib/api/framework-media-removed.txt" "/31/module-lib/api/framework-media.txt" "/31/module-lib/api/framework-permission-removed.txt" "/31/module-lib/api/framework-permission-s-removed.txt" "/31/module-lib/api/framework-permission-s.txt" "/31/module-lib/api/framework-permission.txt" "/31/module-lib/api/framework-scheduling-removed.txt" "/31/module-lib/api/framework-scheduling.txt" "/31/module-lib/api/framework-sdkextensions-removed.txt" "/31/module-lib/api/framework-sdkextensions.txt" "/31/module-lib/api/framework-statsd-removed.txt" "/31/module-lib/api/framework-statsd.txt" "/31/module-lib/api/framework-tethering-removed.txt" "/31/module-lib/api/framework-tethering.txt" "/31/module-lib/api/framework-wifi-removed.txt" "/31/module-lib/api/framework-wifi.txt" "/31/module-lib/framework-connectivity.jar" "/31/module-lib/framework-statsd.jar" "/31/module-lib/framework-wifi.jar" "/31/public/api/android.net.ipsec.ike-removed.txt" "/31/public/api/android.net.ipsec.ike.txt" "/31/public/api/android-non-updatable-incompatibilities.txt" "/31/public/api/android-non-updatable-removed.txt" "/31/public/api/android-non-updatable.txt" "/31/public/api/android.txt" "/31/public/api/art-removed.txt" "/31/public/api/art.txt" "/31/public/api/conscrypt-removed.txt" "/31/public/api/conscrypt.txt" "/31/public/api/framework-connectivity-removed.txt" "/31/public/api/framework-connectivity.txt" "/31/public/api/framework-mediaprovider-removed.txt" "/31/public/api/framework-mediaprovider.txt" "/31/public/api/framework-media-removed.txt" "/31/public/api/framework-media.txt" "/31/public/api/framework-permission-removed.txt" "/31/public/api/framework-permission-s-removed.txt" "/31/public/api/framework-permission-s.txt" "/31/public/api/framework-permission.txt" "/31/public/api/framework-scheduling-removed.txt" "/31/public/api/framework-scheduling.txt" "/31/public/api/framework-sdkextensions-removed.txt" "/31/public/api/framework-sdkextensions.txt" "/31/public/api/framework-statsd-removed.txt" "/31/public/api/framework-statsd.txt" "/31/public/api/framework-tethering-removed.txt" "/31/public/api/framework-tethering.txt" "/31/public/api/framework-wifi-removed.txt" "/31/public/api/framework-wifi.txt" "/31/public/api/org.apache.http.legacy-removed.txt" "/31/public/api/org.apache.http.legacy.txt" "/31/public/api/runtime-i18n-removed.txt" "/31/public/api/runtime-i18n.txt" "/31/public/core-for-system-modules.jar" "/31/system/api/android.net.ipsec.ike-incompatibilities.txt" "/31/system/api/android.net.ipsec.ike-removed.txt" "/31/system/api/android.net.ipsec.ike.txt" "/31/system/api/android-non-updatable-incompatibilities.txt" "/31/system/api/android-non-updatable-removed.txt" "/31/system/api/android-non-updatable.txt" "/31/system/api/android.test.base-removed.txt" "/31/system/api/android.test.base.txt" "/31/system/api/android.test.mock-removed.txt" "/31/system/api/android.test.mock.txt" "/31/system/api/android.test.runner-removed.txt" "/31/system/api/android.test.runner.txt" "/31/system/api/android.txt" "/31/system/api/art-removed.txt" "/31/system/api/art.txt" "/31/system/api/framework-connectivity-removed.txt" "/31/system/api/framework-connectivity.txt" "/31/system/api/framework-mediaprovider-removed.txt" "/31/system/api/framework-mediaprovider.txt" "/31/system/api/framework-media-removed.txt" "/31/system/api/framework-media.txt" "/31/system/api/framework-permission-removed.txt" "/31/system/api/framework-permission-s-removed.txt" "/31/system/api/framework-permission-s.txt" "/31/system/api/framework-permission.txt" "/31/system/api/framework-scheduling-removed.txt" "/31/system/api/framework-scheduling.txt" "/31/system/api/framework-sdkextensions-removed.txt" "/31/system/api/framework-sdkextensions.txt" "/31/system/api/framework-statsd-removed.txt" "/31/system/api/framework-statsd.txt" "/31/system/api/framework-tethering-removed.txt" "/31/system/api/framework-tethering.txt" "/31/system/api/framework-wifi-removed.txt" "/31/system/api/framework-wifi.txt" "/31/system/api/org.apache.http.legacy-removed.txt" "/31/system/api/org.apache.http.legacy.txt" "/31/system-server/api/android-non-updatable.txt" "/31/system-server/api/service-permission-removed.txt" "/31/system-server/api/service-permission.txt" "/8/public/android.jar" "/9/public/android.jar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar" "/current/androidx-legacy/manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml" "/current/androidx/m2repository/androidx/activity/activity/1.3.0-alpha03/activity-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/activity/activity-ktx/1.3.0-alpha03/activity-ktx-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/annotation/annotation/1.3.0-alpha01/annotation-1.3.0-alpha01.jar" "/current/androidx/m2repository/androidx/annotation/annotation-experimental/1.2.0-alpha01/annotation-experimental-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat/1.3.0-beta02/appcompat-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat-resources/1.3.0-beta02/appcompat-resources-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/autofill/autofill/1.2.0-alpha01/autofill-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/collection/collection/1.2.0-alpha02/collection-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/collection/collection-ktx/1.2.0-alpha02/collection-ktx-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/concurrent/concurrent-futures/1.2.0-alpha01/concurrent-futures-1.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/core/core/1.6.0-beta03/core-1.6.0-beta03.aar" "/current/androidx/m2repository/androidx/core/core-ktx/1.5.0-beta02/core-ktx-1.5.0-beta02.aar" "/current/androidx/m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar" "/current/androidx/m2repository/androidx/exifinterface/exifinterface/1.4.0-alpha01/exifinterface-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment/1.4.0-alpha01/fragment-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment-ktx/1.4.0-alpha01/fragment-ktx-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/leanback/leanback/1.1.0-beta01/leanback-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/leanback/leanback-preference/1.1.0-beta01/leanback-preference-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common/2.4.0-alpha01/lifecycle-common-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common-java8/2.4.0-alpha01/lifecycle-common-java8-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata/2.4.0-alpha01/lifecycle-livedata-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core/2.4.0-alpha01/lifecycle-livedata-core-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.4.0-alpha01/lifecycle-livedata-core-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-process/2.4.0-alpha01/lifecycle-process-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime/2.4.0-alpha01/lifecycle-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.4.0-alpha01/lifecycle-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-service/2.4.0-alpha01/lifecycle-service-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel/2.4.0-alpha01/lifecycle-viewmodel-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.4.0-alpha01/lifecycle-viewmodel-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.4.0-alpha01/lifecycle-viewmodel-savedstate-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/media/media/1.3.0-beta01/media-1.3.0-beta01.aar" "/current/androidx/m2repository/androidx/mediarouter/mediarouter/1.3.0-alpha01/mediarouter-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/print/print/1.1.0-beta01/print-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview/1.3.0-alpha01/recyclerview-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar" "/current/androidx/m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar" "/current/androidx/m2repository/androidx/room/room-common/2.3.0-beta02/room-common-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler/2.3.0-beta02/room-compiler-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler-processing/2.3.0-beta02/room-compiler-processing-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-migration/2.3.0-beta02/room-migration-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-runtime/2.3.0-beta02/room-runtime-2.3.0-beta02.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate/1.2.0-alpha01/savedstate-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate-ktx/1.2.0-alpha01/savedstate-ktx-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite/2.2.0-alpha01/sqlite-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite-framework/2.2.0-alpha01/sqlite-framework-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.2.0-alpha01/swiperefreshlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/tracing/tracing/1.1.0-alpha01/tracing-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/transition/transition/1.5.0-alpha01/transition-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha03/vectordrawable-1.2.0-alpha03.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/webkit/webkit/1.5.0-alpha01/webkit-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/work/work-runtime/2.7.0-alpha02/work-runtime-2.7.0-alpha02.aar" "/current/androidx/m2repository/androidx/work/work-runtime-ktx/2.7.0-alpha02/work-runtime-ktx-2.7.0-alpha02.aar" "/current/androidx/manifests/androidx.activity_activity/AndroidManifest.xml" "/current/androidx/manifests/androidx.activity_activity-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.annotation_annotation-experimental/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml" "/current/androidx/manifests/androidx.arch.core_core-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml" "/current/androidx/manifests/androidx.autofill_autofill/AndroidManifest.xml" "/current/androidx/manifests/androidx.cardview_cardview/AndroidManifest.xml" "/current/androidx/manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml" "/current/androidx/manifests/androidx.customview_customview/AndroidManifest.xml" "/current/androidx/manifests/androidx.documentfile_documentfile/AndroidManifest.xml" "/current/androidx/manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml" "/current/androidx/manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.interpolator_interpolator/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback-preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.loader_loader/AndroidManifest.xml" "/current/androidx/manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml" "/current/androidx/manifests/androidx.media_media/AndroidManifest.xml" "/current/androidx/manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.palette_palette/AndroidManifest.xml" "/current/androidx/manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.preference_preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.print_print/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml" "/current/androidx/manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml" "/current/androidx/manifests/androidx.room_room-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-builders/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-view/AndroidManifest.xml" "/current/androidx/manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml" "/current/androidx/manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.tracing_tracing/AndroidManifest.xml" "/current/androidx/manifests/androidx.transition_transition/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml" "/current/androidx/manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager_viewpager/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime-ktx/AndroidManifest.xml" "/current/extras/app-toolkit/m2repository/android/arch/core/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/core/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/livedata-core/28.0.0/livedata-core-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/viewmodel/28.0.0/viewmodel-28.0.0.aar" "/current/extras/app-toolkit/manifests/android-arch-core-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-livedata-core/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-viewmodel/AndroidManifest.xml" "/current/extras/constraint-layout-x/constraintlayout/2.0.0-beta7/constraintlayout-2.0.0-beta7.aar" "/current/extras/constraint-layout-x/constraintlayout-solver/2.0.0-beta7/constraintlayout-solver-2.0.0-beta7.jar" "/current/extras/constraint-layout-x/manifests/androidx-constraintlayout_constraintlayout/AndroidManifest.xml" "/current/extras/material-design/design/com/android/support/design/28.0.0/design-28.0.0.aar" "/current/extras/material-design/manifests/android-support-design/AndroidManifest.xml" "/current/extras/material-design-x/com/google/android/material/material/1.4.0/material-1.4.0.aar" "/current/extras/material-design-x/manifests/com.google.android.material_material/AndroidManifest.xml" "/current/public/android.jar" "/current/support/m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar" "/current/support/m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar" "/current/support/m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar" "/current/support/m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar" "/current/support/m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar" "/current/support/m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar" "/current/support/m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar" "/current/support/m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar" "/current/support/m2repository/com/android/support/print/28.0.0/print-28.0.0.aar" "/current/support/m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar" "/current/support/m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar" "/current/support/m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar" "/current/support/m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar" "/current/support/m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar" "/current/support/m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar" "/current/support/m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar" "/current/support/m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar" "/current/support/m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar" "/current/support/manifests/android-support-animatedvectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-asynclayoutinflater/AndroidManifest.xml" "/current/support/manifests/android-support-compat/AndroidManifest.xml" "/current/support/manifests/android-support-coordinatorlayout/AndroidManifest.xml" "/current/support/manifests/android-support-core-ui/AndroidManifest.xml" "/current/support/manifests/android-support-core-utils/AndroidManifest.xml" "/current/support/manifests/android-support-cursoradapter/AndroidManifest.xml" "/current/support/manifests/android-support-customview/AndroidManifest.xml" "/current/support/manifests/android-support-documentfile/AndroidManifest.xml" "/current/support/manifests/android-support-drawerlayout/AndroidManifest.xml" "/current/support/manifests/android-support-dynamic-animation/AndroidManifest.xml" "/current/support/manifests/android-support-fragment/AndroidManifest.xml" "/current/support/manifests/android-support-interpolator/AndroidManifest.xml" "/current/support/manifests/android-support-loader/AndroidManifest.xml" "/current/support/manifests/android-support-localbroadcastmanager/AndroidManifest.xml" "/current/support/manifests/android-support-media-compat/AndroidManifest.xml" "/current/support/manifests/android-support-print/AndroidManifest.xml" "/current/support/manifests/android-support-slidingpanelayout/AndroidManifest.xml" "/current/support/manifests/android-support-swiperefreshlayout/AndroidManifest.xml" "/current/support/manifests/android-support-transition/AndroidManifest.xml" "/current/support/manifests/android-support-v13/AndroidManifest.xml" "/current/support/manifests/android-support-v4/AndroidManifest.xml" "/current/support/manifests/android-support-v7-appcompat/AndroidManifest.xml" "/current/support/manifests/android-support-v7-cardview/AndroidManifest.xml" "/current/support/manifests/android-support-v7-recyclerview/AndroidManifest.xml" "/current/support/manifests/android-support-vectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-viewpager/AndroidManifest.xml" "/current/support/manifests/android-versionedparcelable/AndroidManifest.xml" "/current/system/android.jar" "/current/system/android.net.ipsec.ike.jar" "/tools/core-lambda-stubs.jar" "/tools/linux/lib64/libclang_android.so" "/tools/linux/lib64/libLLVM_android.so"
clone_project platform/prebuilts/tools prebuilts/tools android12-gsi "/common/m2/repository/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar" "/common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110/symbol-processing-api-1.4.10-dev-experimental-20201110.jar" "/common/m2/repository/com/google/guava/guava/23.0/guava-23.0.jar" "/common/m2/repository/com/google/guava/guava/listenablefuture/1.0/listenablefuture-1.0.jar" "/common/m2/repository/commons-codec/commons-codec/1.10/commons-codec-1.10.jar" "/common/m2/repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar" "/common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041/jaxb-api-2.2.12-b140109.1041.jar" "/common/m2/repository/org/jetbrains/annotations/13.0/annotations-13.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0/kotlinx-coroutines-android-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0/kotlinx-coroutines-core-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0/kotlinx-metadata-jvm-0.1.0.jar" "/common/m2/repository/org/jetbrains/trove4j/trove4j/20160824/trove4j-20160824.jar" "/common/m2/repository/org/ow2/asm/asm/6.1.1/asm-6.1.1.jar" "/common/m2/repository/org/ow2/asm/asm-tree/6.1.1/asm-tree-6.1.1.jar" "/common/m2/repository/org/xerial/sqlite-jdbc/3.28.0/sqlite-jdbc-3.28.0.jar"
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/iorap
clone_depth_platform system/sepolicy
clone_depth_platform tools/apifinder
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/signapk/signapk^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/jsonmodify^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/avbtool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/make_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/sload_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icing/proto/icing-java-proto-lite^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icing/java/libicing-java^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icing/libicing^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsr330/jsr330^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/junit/junit^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-java-nano^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/protoc-gen-javanano^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/sefcontext_compile^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/minigzip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SystemUI/plugin_core/PluginCoreLib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsTheme/SettingsLibSettingsTheme^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/SettingsTheme/SettingsLibSettingsTheme^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/Utils/SettingsLibUtils^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SettingsLib/Utils/SettingsLibUtils^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_module_lib_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/com.android.appsearch-bootclasspath-fragment^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/errorprone/error_prone_android_framework_lib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/framework/framework-appsearch.impl^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-minus-apex^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-updatable-stubs-module_libs_api^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/protologtool/protologtool^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/packages/SystemUI/shared/statslog-SystemUI-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/service/statslog-appsearch-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/media/framework/updatable-media^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/framework-annotations-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/com/android/internal/util/modules-utils-preconditions^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/iconloaderlib/iconloader_base^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/framework/framework-statsd.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable.api.system-server.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.base-incompatibilities.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.base-removed.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.base.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.mock-incompatibilities.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.mock-removed.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.mock.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.runner-incompatibilities.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.runner-removed.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.test.runner.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.activity_activity^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cardview_cardview^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.core_core^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.customview_customview^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.dynamicanimation_dynamicanimation^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.fragment_fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.loader_loader^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.preference_preference^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.tracing_tracing^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.transition_transition^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager2_viewpager2^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/material-design-x/com.google.android.material_material^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/kotlinx-coroutines-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexer/apexer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/app-compat-annotations^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .

echo "building wm_shell_protolog-groups^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja wm_shell_protolog-groups,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/wm_shell_protolog-groups^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/wm_shell_protolog-groups^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/wm_shell_protolog-groups^android_common

echo "building wm_shell_protolog_src^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja wm_shell_protolog_src,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/wm_shell_protolog_src^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/wm_shell_protolog_src^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/wm_shell_protolog_src^

echo "building uiautomator.core^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja uiautomator.core,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/uiautomator/library/uiautomator.core^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/uiautomator.core^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/uiautomator/library/uiautomator.core^android_common

echo "building statslog-appsearch-lib^android_common_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja statslog-appsearch-lib,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-lib^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/statslog-appsearch-lib^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-lib^android_common_apex10000

echo "building services.wifi^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja services.wifi,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/wifi/services.wifi^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/services.wifi^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/wifi/services.wifi^android_common

echo "building services.core.protologsrc^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja services.core.protologsrc,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.protologsrc^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/services.core.protologsrc^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.protologsrc^

echo "building services.core.json.gz^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja services.core.json.gz,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.json.gz^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/services.core.json.gz^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/services.core.json.gz^

echo "building services-non-updatable-stubs^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja services-non-updatable-stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-non-updatable-stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/services-non-updatable-stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/services-non-updatable-stubs^android_common

echo "building service-media-s^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja service-media-s,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/service/service-media-s^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/service-media-s^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/service/service-media-s^android_common_apex29

echo "building service-appsearch^android_common_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja service-appsearch,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/service-appsearch^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/service-appsearch^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/service-appsearch^android_common_apex10000

echo "building protolog.conf.json.gz^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja protolog.conf.json.gz,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/protolog.conf.json.gz^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/protolog.conf.json.gz^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/protolog.conf.json.gz^android_x86_64

echo "building framework^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja framework,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/framework^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework^android_common

echo "building protolog-lib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja protolog-lib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/protolog-lib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/protolog-lib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/protolog-lib^android_common

echo "building protolog-groups^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja protolog-groups,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/protolog-groups^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/protolog-groups^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/protolog-groups^android_common

echo "building lockagent^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja lockagent,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/lockagent^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent^android_common

echo "building generate-wm_shell_protolog.json^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja generate-wm_shell_protolog.json,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/generate-wm_shell_protolog.json^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/generate-wm_shell_protolog.json^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/generate-wm_shell_protolog.json^

echo "building generate-protolog.json^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja generate-protolog.json,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/generate-protolog.json^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/generate-protolog.json^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/generate-protolog.json^

echo "building com.android.appsearch^android_common_com.android.appsearch_image"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja com.android.appsearch,android_common_com.android.appsearch_image
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/com.android.appsearch^android_common_com.android.appsearch_image
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/com.android.appsearch^android_common_com.android.appsearch_image.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/com.android.appsearch^android_common_com.android.appsearch_image

echo "building checked-protolog.json^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja checked-protolog.json,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/checked-protolog.json^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/checked-protolog.json^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/checked-protolog.json^

echo "building android_system_server_stubs_current^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android_system_server_stubs_current,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/android_system_server_stubs_current^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android_system_server_stubs_current^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/android_system_server_stubs_current^android_common

echo "building android.test.mock.stubs.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.mock.stubs.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.stubs.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.mock.stubs.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.stubs.system^android_common

echo "building android.test.base.stubs.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.base.stubs.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.stubs.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.base.stubs.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.stubs.system^android_common

echo "building android.test.runner.stubs.source.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.runner.stubs.source.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.stubs.source.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.runner.stubs.source.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.stubs.source.system^android_common

echo "building android.test.runner.stubs.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.runner.stubs.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.stubs.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.runner.stubs.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-runner/android.test.runner.stubs.system^android_common

echo "building android.test.mock.stubs.source.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.mock.stubs.source.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.stubs.source.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.mock.stubs.source.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-mock/android.test.mock.stubs.source.system^android_common

echo "building android.test.base.stubs.source.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja android.test.base.stubs.source.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.stubs.source.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/android.test.base.stubs.source.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-base/android.test.base.stubs.source.system^android_common

echo "building WindowManager-Shell-proto^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja WindowManager-Shell-proto,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/WindowManager-Shell-proto^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/WindowManager-Shell-proto^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/WindowManager-Shell-proto^android_common

echo "building WindowManager-Shell^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja WindowManager-Shell,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/WindowManager-Shell^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/WindowManager-Shell^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/WindowManager/Shell/WindowManager-Shell^android_common

echo "building SystemUISharedLib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUISharedLib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/SystemUISharedLib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUISharedLib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/SystemUISharedLib^android_common

echo "building SystemUIAnimationLib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUIAnimationLib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/animation/SystemUIAnimationLib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUIAnimationLib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/animation/SystemUIAnimationLib^android_common

echo "building SystemUIPluginLib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUIPluginLib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/plugin/SystemUIPluginLib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUIPluginLib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/plugin/SystemUIPluginLib^android_common

echo "building SystemUI-tags^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUI-tags,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI-tags^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUI-tags^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI-tags^android_common

echo "building SystemUI-statsd^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUI-statsd,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/SystemUI-statsd^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUI-statsd^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/SystemUI-statsd^android_common

echo "building SystemUI-proto^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SystemUI-proto,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI-proto^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SystemUI-proto^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/SystemUI-proto^android_common

echo "building SettingsLibUsageProgressBarPreference^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibUsageProgressBarPreference,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/UsageProgressBarPreference/SettingsLibUsageProgressBarPreference^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibUsageProgressBarPreference^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/UsageProgressBarPreference/SettingsLibUsageProgressBarPreference^android_common

echo "building SettingsLibTile^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibTile,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/Tile/SettingsLibTile^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibTile^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/Tile/SettingsLibTile^android_common

echo "building SettingsLibSettingsTransition^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibSettingsTransition,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/SettingsTransition/SettingsLibSettingsTransition^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibSettingsTransition^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/SettingsTransition/SettingsLibSettingsTransition^android_common_apex30

echo "building SettingsLibSettingsTransition^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibSettingsTransition,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/SettingsTransition/SettingsLibSettingsTransition^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibSettingsTransition^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/SettingsTransition/SettingsLibSettingsTransition^android_common

echo "building SettingsLibDisplayDensityUtils^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibDisplayDensityUtils,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/DisplayDensityUtils/SettingsLibDisplayDensityUtils^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibDisplayDensityUtils^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/DisplayDensityUtils/SettingsLibDisplayDensityUtils^android_common

echo "building SettingsLibCollapsingToolbarBaseActivity^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibCollapsingToolbarBaseActivity,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/CollapsingToolbarBaseActivity/SettingsLibCollapsingToolbarBaseActivity^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibCollapsingToolbarBaseActivity^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/CollapsingToolbarBaseActivity/SettingsLibCollapsingToolbarBaseActivity^android_common_apex30

echo "building SettingsLibCollapsingToolbarBaseActivity^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibCollapsingToolbarBaseActivity,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/CollapsingToolbarBaseActivity/SettingsLibCollapsingToolbarBaseActivity^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibCollapsingToolbarBaseActivity^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/CollapsingToolbarBaseActivity/SettingsLibCollapsingToolbarBaseActivity^android_common

echo "building SettingsLibAdaptiveIcon^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja SettingsLibAdaptiveIcon,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/AdaptiveIcon/SettingsLibAdaptiveIcon^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/platform/frameworks/base/SettingsLibAdaptiveIcon^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/AdaptiveIcon/SettingsLibAdaptiveIcon^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_24 platform_frameworks_base.tar.zst --clobber

du -ah -d1 platform_frameworks_base*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icing.tar.zst" ]; then
  echo "Compressing external/icing -> external_icing.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icing.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icing/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsr330.tar.zst" ]; then
  echo "Compressing external/jsr330 -> external_jsr330.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsr330.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsr330/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_junit.tar.zst" ]; then
  echo "Compressing external/junit -> external_junit.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/junit/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_systemui.tar.zst" ]; then
  echo "Compressing frameworks/libs/systemui -> frameworks_libs_systemui.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_systemui.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/systemui/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_frameworks_base.tar.zst" ]; then
  echo "Compressing platform/frameworks/base -> platform_frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_iorap.tar.zst" ]; then
  echo "Compressing system/iorap -> system_iorap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_iorap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/iorap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst" ]; then
  echo "Compressing tools/apifinder -> tools_apifinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apifinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi

rm -rf aosp
