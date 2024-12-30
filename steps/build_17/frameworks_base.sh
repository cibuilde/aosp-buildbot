set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform dalvik
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform frameworks/opt/net/voip
clone_depth_platform frameworks/opt/telephony
clone_depth_platform frameworks/proto_logging
clone_depth_platform frameworks/wilhelm
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/Permission
clone_depth_platform packages/modules/Wifi
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/sdk prebuilts/sdk android12-gsi "/14/public/android.jar" "/15/public/android.jar" "/16/public/android.jar" "/17/public/android.jar" "/21/public/android.jar" "/28/public/android.jar" "/28/public/org.apache.http.legacy.jar" "/29/public/android.jar" "/29/system/android.jar" "/30/module-lib/android.jar" "/30/public/android.jar" "/30/public/core-for-system-modules.jar" "/30/system/android.jar" "/31/module-lib/android.jar" "/31/module-lib/api/android.net.ipsec.ike-removed.txt" "/31/module-lib/api/android.net.ipsec.ike.txt" "/31/module-lib/api/android-non-updatable-removed.txt" "/31/module-lib/api/android-non-updatable.txt" "/31/module-lib/api/android.txt" "/31/module-lib/api/art-removed.txt" "/31/module-lib/api/art.txt" "/31/module-lib/api/framework-connectivity-removed.txt" "/31/module-lib/api/framework-connectivity.txt" "/31/module-lib/api/framework-mediaprovider-removed.txt" "/31/module-lib/api/framework-mediaprovider.txt" "/31/module-lib/api/framework-media-removed.txt" "/31/module-lib/api/framework-media.txt" "/31/module-lib/api/framework-permission-removed.txt" "/31/module-lib/api/framework-permission-s-removed.txt" "/31/module-lib/api/framework-permission-s.txt" "/31/module-lib/api/framework-permission.txt" "/31/module-lib/api/framework-scheduling-removed.txt" "/31/module-lib/api/framework-scheduling.txt" "/31/module-lib/api/framework-sdkextensions-removed.txt" "/31/module-lib/api/framework-sdkextensions.txt" "/31/module-lib/api/framework-statsd-removed.txt" "/31/module-lib/api/framework-statsd.txt" "/31/module-lib/api/framework-tethering-removed.txt" "/31/module-lib/api/framework-tethering.txt" "/31/module-lib/api/framework-wifi-removed.txt" "/31/module-lib/api/framework-wifi.txt" "/31/module-lib/framework-connectivity.jar" "/31/module-lib/framework-statsd.jar" "/31/module-lib/framework-wifi.jar" "/31/public/api/android.net.ipsec.ike-removed.txt" "/31/public/api/android.net.ipsec.ike.txt" "/31/public/api/android-non-updatable-incompatibilities.txt" "/31/public/api/android-non-updatable-removed.txt" "/31/public/api/android-non-updatable.txt" "/31/public/api/android.txt" "/31/public/api/art-removed.txt" "/31/public/api/art.txt" "/31/public/api/conscrypt-removed.txt" "/31/public/api/conscrypt.txt" "/31/public/api/framework-connectivity-removed.txt" "/31/public/api/framework-connectivity.txt" "/31/public/api/framework-mediaprovider-removed.txt" "/31/public/api/framework-mediaprovider.txt" "/31/public/api/framework-media-removed.txt" "/31/public/api/framework-media.txt" "/31/public/api/framework-permission-removed.txt" "/31/public/api/framework-permission-s-removed.txt" "/31/public/api/framework-permission-s.txt" "/31/public/api/framework-permission.txt" "/31/public/api/framework-scheduling-removed.txt" "/31/public/api/framework-scheduling.txt" "/31/public/api/framework-sdkextensions-removed.txt" "/31/public/api/framework-sdkextensions.txt" "/31/public/api/framework-statsd-removed.txt" "/31/public/api/framework-statsd.txt" "/31/public/api/framework-tethering-removed.txt" "/31/public/api/framework-tethering.txt" "/31/public/api/framework-wifi-removed.txt" "/31/public/api/framework-wifi.txt" "/31/public/api/org.apache.http.legacy-removed.txt" "/31/public/api/org.apache.http.legacy.txt" "/31/public/api/runtime-i18n-removed.txt" "/31/public/api/runtime-i18n.txt" "/31/public/core-for-system-modules.jar" "/31/system/api/android.net.ipsec.ike-incompatibilities.txt" "/31/system/api/android.net.ipsec.ike-removed.txt" "/31/system/api/android.net.ipsec.ike.txt" "/31/system/api/android-non-updatable-incompatibilities.txt" "/31/system/api/android-non-updatable-removed.txt" "/31/system/api/android-non-updatable.txt" "/31/system/api/android.test.base-removed.txt" "/31/system/api/android.test.base.txt" "/31/system/api/android.test.mock-removed.txt" "/31/system/api/android.test.mock.txt" "/31/system/api/android.test.runner-removed.txt" "/31/system/api/android.test.runner.txt" "/31/system/api/android.txt" "/31/system/api/art-removed.txt" "/31/system/api/art.txt" "/31/system/api/framework-connectivity-removed.txt" "/31/system/api/framework-connectivity.txt" "/31/system/api/framework-mediaprovider-removed.txt" "/31/system/api/framework-mediaprovider.txt" "/31/system/api/framework-media-removed.txt" "/31/system/api/framework-media.txt" "/31/system/api/framework-permission-removed.txt" "/31/system/api/framework-permission-s-removed.txt" "/31/system/api/framework-permission-s.txt" "/31/system/api/framework-permission.txt" "/31/system/api/framework-scheduling-removed.txt" "/31/system/api/framework-scheduling.txt" "/31/system/api/framework-sdkextensions-removed.txt" "/31/system/api/framework-sdkextensions.txt" "/31/system/api/framework-statsd-removed.txt" "/31/system/api/framework-statsd.txt" "/31/system/api/framework-tethering-removed.txt" "/31/system/api/framework-tethering.txt" "/31/system/api/framework-wifi-removed.txt" "/31/system/api/framework-wifi.txt" "/31/system/api/org.apache.http.legacy-removed.txt" "/31/system/api/org.apache.http.legacy.txt" "/31/system-server/api/android-non-updatable.txt" "/31/system-server/api/service-permission-removed.txt" "/31/system-server/api/service-permission.txt" "/8/public/android.jar" "/9/public/android.jar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar" "/current/androidx-legacy/m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar" "/current/androidx-legacy/manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml" "/current/androidx-legacy/manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml" "/current/androidx/m2repository/androidx/activity/activity/1.3.0-alpha03/activity-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/activity/activity-ktx/1.3.0-alpha03/activity-ktx-1.3.0-alpha03.aar" "/current/androidx/m2repository/androidx/annotation/annotation/1.3.0-alpha01/annotation-1.3.0-alpha01.jar" "/current/androidx/m2repository/androidx/annotation/annotation-experimental/1.2.0-alpha01/annotation-experimental-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat/1.3.0-beta02/appcompat-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/appcompat/appcompat-resources/1.3.0-beta02/appcompat-resources-1.3.0-beta02.aar" "/current/androidx/m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/autofill/autofill/1.2.0-alpha01/autofill-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/collection/collection/1.2.0-alpha02/collection-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/collection/collection-ktx/1.2.0-alpha02/collection-ktx-1.2.0-alpha02.jar" "/current/androidx/m2repository/androidx/concurrent/concurrent-futures/1.2.0-alpha01/concurrent-futures-1.2.0-alpha01.jar" "/current/androidx/m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/core/core/1.6.0-beta03/core-1.6.0-beta03.aar" "/current/androidx/m2repository/androidx/core/core-ktx/1.5.0-beta02/core-ktx-1.5.0-beta02.aar" "/current/androidx/m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar" "/current/androidx/m2repository/androidx/exifinterface/exifinterface/1.4.0-alpha01/exifinterface-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment/1.4.0-alpha01/fragment-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/fragment/fragment-ktx/1.4.0-alpha01/fragment-ktx-1.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/leanback/leanback/1.1.0-beta01/leanback-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/leanback/leanback-preference/1.1.0-beta01/leanback-preference-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common/2.4.0-alpha01/lifecycle-common-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-common-java8/2.4.0-alpha01/lifecycle-common-java8-2.4.0-alpha01.jar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata/2.4.0-alpha01/lifecycle-livedata-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core/2.4.0-alpha01/lifecycle-livedata-core-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.4.0-alpha01/lifecycle-livedata-core-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-process/2.4.0-alpha01/lifecycle-process-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime/2.4.0-alpha01/lifecycle-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.4.0-alpha01/lifecycle-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-service/2.4.0-alpha01/lifecycle-service-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel/2.4.0-alpha01/lifecycle-viewmodel-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.4.0-alpha01/lifecycle-viewmodel-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.4.0-alpha01/lifecycle-viewmodel-savedstate-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/media/media/1.3.0-beta01/media-1.3.0-beta01.aar" "/current/androidx/m2repository/androidx/mediarouter/mediarouter/1.3.0-alpha01/mediarouter-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar" "/current/androidx/m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/print/print/1.1.0-beta01/print-1.1.0-beta01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview/1.3.0-alpha01/recyclerview-1.3.0-alpha01.aar" "/current/androidx/m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar" "/current/androidx/m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar" "/current/androidx/m2repository/androidx/room/room-common/2.3.0-beta02/room-common-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler/2.3.0-beta02/room-compiler-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-compiler-processing/2.3.0-beta02/room-compiler-processing-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-migration/2.3.0-beta02/room-migration-2.3.0-beta02.jar" "/current/androidx/m2repository/androidx/room/room-runtime/2.3.0-beta02/room-runtime-2.3.0-beta02.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate/1.2.0-alpha01/savedstate-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/savedstate/savedstate-ktx/1.2.0-alpha01/savedstate-ktx-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite/2.2.0-alpha01/sqlite-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/sqlite/sqlite-framework/2.2.0-alpha01/sqlite-framework-2.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.2.0-alpha01/swiperefreshlayout-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/tracing/tracing/1.1.0-alpha01/tracing-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/transition/transition/1.5.0-alpha01/transition-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha03/vectordrawable-1.2.0-alpha03.aar" "/current/androidx/m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar" "/current/androidx/m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar" "/current/androidx/m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar" "/current/androidx/m2repository/androidx/webkit/webkit/1.5.0-alpha01/webkit-1.5.0-alpha01.aar" "/current/androidx/m2repository/androidx/work/work-runtime/2.7.0-alpha02/work-runtime-2.7.0-alpha02.aar" "/current/androidx/m2repository/androidx/work/work-runtime-ktx/2.7.0-alpha02/work-runtime-ktx-2.7.0-alpha02.aar" "/current/androidx/manifests/androidx.activity_activity/AndroidManifest.xml" "/current/androidx/manifests/androidx.activity_activity-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.annotation_annotation-experimental/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat/AndroidManifest.xml" "/current/androidx/manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml" "/current/androidx/manifests/androidx.arch.core_core-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml" "/current/androidx/manifests/androidx.autofill_autofill/AndroidManifest.xml" "/current/androidx/manifests/androidx.cardview_cardview/AndroidManifest.xml" "/current/androidx/manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core/AndroidManifest.xml" "/current/androidx/manifests/androidx.core_core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml" "/current/androidx/manifests/androidx.customview_customview/AndroidManifest.xml" "/current/androidx/manifests/androidx.documentfile_documentfile/AndroidManifest.xml" "/current/androidx/manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml" "/current/androidx/manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.interpolator_interpolator/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback/AndroidManifest.xml" "/current/androidx/manifests/androidx.leanback_leanback-preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.loader_loader/AndroidManifest.xml" "/current/androidx/manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml" "/current/androidx/manifests/androidx.media_media/AndroidManifest.xml" "/current/androidx/manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui/AndroidManifest.xml" "/current/androidx/manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.palette_palette/AndroidManifest.xml" "/current/androidx/manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.preference_preference/AndroidManifest.xml" "/current/androidx/manifests/androidx.print_print/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml" "/current/androidx/manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml" "/current/androidx/manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml" "/current/androidx/manifests/androidx.room_room-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate/AndroidManifest.xml" "/current/androidx/manifests/androidx.savedstate_savedstate-ktx/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-builders/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-core/AndroidManifest.xml" "/current/androidx/manifests/androidx.slice_slice-view/AndroidManifest.xml" "/current/androidx/manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite/AndroidManifest.xml" "/current/androidx/manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml" "/current/androidx/manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml" "/current/androidx/manifests/androidx.tracing_tracing/AndroidManifest.xml" "/current/androidx/manifests/androidx.transition_transition/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml" "/current/androidx/manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml" "/current/androidx/manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml" "/current/androidx/manifests/androidx.viewpager_viewpager/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime/AndroidManifest.xml" "/current/androidx/manifests/androidx.work_work-runtime-ktx/AndroidManifest.xml" "/current/extras/app-toolkit/m2repository/android/arch/core/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/core/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/common/28.0.0/common-28.0.0.jar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/livedata-core/28.0.0/livedata-core-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/runtime/28.0.0/runtime-28.0.0.aar" "/current/extras/app-toolkit/m2repository/android/arch/lifecycle/viewmodel/28.0.0/viewmodel-28.0.0.aar" "/current/extras/app-toolkit/manifests/android-arch-core-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-livedata-core/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-runtime/AndroidManifest.xml" "/current/extras/app-toolkit/manifests/android-arch-lifecycle-viewmodel/AndroidManifest.xml" "/current/extras/constraint-layout-x/constraintlayout/2.0.0-beta7/constraintlayout-2.0.0-beta7.aar" "/current/extras/constraint-layout-x/constraintlayout-solver/2.0.0-beta7/constraintlayout-solver-2.0.0-beta7.jar" "/current/extras/constraint-layout-x/manifests/androidx-constraintlayout_constraintlayout/AndroidManifest.xml" "/current/extras/material-design/design/com/android/support/design/28.0.0/design-28.0.0.aar" "/current/extras/material-design/manifests/android-support-design/AndroidManifest.xml" "/current/extras/material-design-x/com/google/android/material/material/1.4.0/material-1.4.0.aar" "/current/extras/material-design-x/manifests/com.google.android.material_material/AndroidManifest.xml" "/current/public/android.jar" "/current/support/m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar" "/current/support/m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar" "/current/support/m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar" "/current/support/m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar" "/current/support/m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar" "/current/support/m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar" "/current/support/m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar" "/current/support/m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar" "/current/support/m2repository/com/android/support/print/28.0.0/print-28.0.0.aar" "/current/support/m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar" "/current/support/m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar" "/current/support/m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar" "/current/support/m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar" "/current/support/m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar" "/current/support/m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar" "/current/support/m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar" "/current/support/m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar" "/current/support/m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar" "/current/support/m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar" "/current/support/m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar" "/current/support/m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar" "/current/support/m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar" "/current/support/m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar" "/current/support/manifests/android-support-animatedvectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-asynclayoutinflater/AndroidManifest.xml" "/current/support/manifests/android-support-compat/AndroidManifest.xml" "/current/support/manifests/android-support-coordinatorlayout/AndroidManifest.xml" "/current/support/manifests/android-support-core-ui/AndroidManifest.xml" "/current/support/manifests/android-support-core-utils/AndroidManifest.xml" "/current/support/manifests/android-support-cursoradapter/AndroidManifest.xml" "/current/support/manifests/android-support-customview/AndroidManifest.xml" "/current/support/manifests/android-support-documentfile/AndroidManifest.xml" "/current/support/manifests/android-support-drawerlayout/AndroidManifest.xml" "/current/support/manifests/android-support-dynamic-animation/AndroidManifest.xml" "/current/support/manifests/android-support-fragment/AndroidManifest.xml" "/current/support/manifests/android-support-interpolator/AndroidManifest.xml" "/current/support/manifests/android-support-loader/AndroidManifest.xml" "/current/support/manifests/android-support-localbroadcastmanager/AndroidManifest.xml" "/current/support/manifests/android-support-media-compat/AndroidManifest.xml" "/current/support/manifests/android-support-print/AndroidManifest.xml" "/current/support/manifests/android-support-slidingpanelayout/AndroidManifest.xml" "/current/support/manifests/android-support-swiperefreshlayout/AndroidManifest.xml" "/current/support/manifests/android-support-transition/AndroidManifest.xml" "/current/support/manifests/android-support-v13/AndroidManifest.xml" "/current/support/manifests/android-support-v4/AndroidManifest.xml" "/current/support/manifests/android-support-v7-appcompat/AndroidManifest.xml" "/current/support/manifests/android-support-v7-cardview/AndroidManifest.xml" "/current/support/manifests/android-support-v7-recyclerview/AndroidManifest.xml" "/current/support/manifests/android-support-vectordrawable/AndroidManifest.xml" "/current/support/manifests/android-support-viewpager/AndroidManifest.xml" "/current/support/manifests/android-versionedparcelable/AndroidManifest.xml" "/current/system/android.jar" "/current/system/android.net.ipsec.ike.jar" "/tools/core-lambda-stubs.jar" "/tools/linux/lib64/libclang_android.so" "/tools/linux/lib64/libLLVM_android.so"
clone_depth_platform system/bt
clone_depth_platform system/connectivity/wificond
clone_depth_platform system/core
clone_depth_platform system/gsid
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/security
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine
clone_depth_platform system/vold
clone_depth_platform tools/apifinder
clone_depth_platform tools/metalava

rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-javastream-protos^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/proto/framework-protos^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res-package-jar^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/jni/libandroid_runtime^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/jni/libandroid_runtime^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/androidfw/libandroidfw^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/cmds/bootanimation/libbootanimation^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/java/statslog-framework-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/telephony/common/statslog-telephony-common-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/framework-annotations-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libOpenSLES^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libwilhelm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libwilhelm^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/config/audio_policy_configuration_V7_0^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable-incompatibilities.api.public.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable-incompatibilities.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable-removed.api.module-lib.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable-removed.api.public.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable-removed.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable.api.module-lib.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable.api.public.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android-non-updatable.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.api.module-lib.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.api.public.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/android.api.system.latest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/sdk_system_current_android.net.ipsec.ike^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/sdk_system_current_android^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/aidl/android.security.apc-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/aidl/android.security.authorization-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/aidl/android.security.legacykeystore-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/aidl/android.security.maintenance-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/aidl/android.security.metrics-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/stub-annotations^android_common/ .

echo "building android-non-updatable.stubs.module_lib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja android-non-updatable.stubs.module_lib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/android-non-updatable.stubs.module_lib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/android-non-updatable.stubs.module_lib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/android-non-updatable.stubs.module_lib^android_common

echo "building android_module_lib_stubs_current^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja android_module_lib_stubs_current,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/android_module_lib_stubs_current^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/android_module_lib_stubs_current^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/android_module_lib_stubs_current^android_common

echo "building api-stubs-docs-non-updatable^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja api-stubs-docs-non-updatable,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/api-stubs-docs-non-updatable^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/api-stubs-docs-non-updatable^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/api-stubs-docs-non-updatable^android_common

echo "building app_process^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja app_process,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/app_process/app_process^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/app_process^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/app_process/app_process^android_x86_64

echo "building app_process^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja app_process,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/app_process/app_process^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/app_process^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/app_process/app_process^android_x86_x86_64

echo "building bootanimation^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja bootanimation,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/bootanimation/bootanimation^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/bootanimation^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/bootanimation/bootanimation^android_x86_64

echo "building framework-graphics.stubs.source.module_lib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs.source.module_lib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source.module_lib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs.source.module_lib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source.module_lib^android_common

echo "building framework-graphics.stubs.module_lib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs.module_lib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.module_lib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs.module_lib^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.module_lib^android_common

echo "building framework-graphics.stubs.source.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs.source.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs.source.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source.system^android_common

echo "building framework-graphics.stubs.source^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs.source,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs.source^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.source^android_common

echo "building framework-graphics.stubs.system^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs.system,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.system^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs.system^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs.system^android_common

echo "building framework-graphics.stubs^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics.stubs^android_common

echo "building framework-graphics^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja framework-graphics,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/framework-graphics^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common

echo "building module-lib-api-stubs-docs-non-updatable^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja module-lib-api-stubs-docs-non-updatable,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/module-lib-api-stubs-docs-non-updatable^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/module-lib-api-stubs-docs-non-updatable^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/module-lib-api-stubs-docs-non-updatable^android_common

echo "building system-api-stubs-docs-non-updatable^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja system-api-stubs-docs-non-updatable,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/system-api-stubs-docs-non-updatable^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/system-api-stubs-docs-non-updatable^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/system-api-stubs-docs-non-updatable^android_common

echo "building test-api-stubs-docs-non-updatable^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_17.ninja test-api-stubs-docs-non-updatable,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/test-api-stubs-docs-non-updatable^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_17/frameworks/base/test-api-stubs-docs-non-updatable^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/test-api-stubs-docs-non-updatable^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_17 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/voip -> frameworks_opt_net_voip.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/voip/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst" ]; then
  echo "Compressing frameworks/opt/telephony -> frameworks_opt_telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/telephony/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_connectivity_wificond.tar.zst" ]; then
  echo "Compressing system/connectivity/wificond -> system_connectivity_wificond.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_connectivity_wificond.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/connectivity/wificond/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_vold.tar.zst" ]; then
  echo "Compressing system/vold -> system_vold.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_vold.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/vold/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst" ]; then
  echo "Compressing tools/apifinder -> tools_apifinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apifinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_metalava.tar.zst" ]; then
  echo "Compressing tools/metalava -> tools_metalava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/metalava/ .
fi

rm -rf aosp
