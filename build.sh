mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include
printf "cc_prebuilt_library_headers {\n  name: \"libhardware_legacy_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libcutils_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\"],\n}\n" >> prebuiltlibs/hardware/libhardware_legacy/Android.bp
tar cfJ hardware_libhardware_legacy-9.tar.xz -C prebuiltlibs/hardware/libhardware_legacy/ .
mkdir -p prebuiltlibs/external/Reactive-Extensions/RxCpp/Rx/v2/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/Reactive-Extensions/RxCpp/Rx/v2/src/ prebuiltlibs/external/Reactive-Extensions/RxCpp/Rx/v2/src
printf "cc_prebuilt_library_headers {\n  name: \"librxcpp\",\n  host_supported: true,\n  export_include_dirs: [\"Rx/v2/src\"],\n}\n" >> prebuiltlibs/external/Reactive-Extensions/RxCpp/Android.bp
tar cfJ external_Reactive-Extensions_RxCpp-9.tar.xz -C prebuiltlibs/external/Reactive-Extensions/RxCpp/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so \
out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so \
out/soong/.intermediates/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a \
out/soong/.intermediates/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so \
out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a \
out/soong/.intermediates/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2 \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so \
out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2 \
out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d \
out/soong/.intermediates/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a \
out/soong/.intermediates/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler \
out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so \
out/soong/.intermediates/frameworks/base/cmds/incident/incident/android_x86_64/incident \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so \
out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so \
out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a \
out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a \
out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so \
out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so \
out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so \


mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so
mkdir -p prebuiltlibs/frameworks/base/native/android/aidl
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/native/android/aidl/ prebuiltlibs/frameworks/base/native/android/aidl
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/androidfw/include/ prebuiltlibs/frameworks/base/libs/androidfw/include
mkdir -p prebuiltlibs/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a prebuiltlibs/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a
mkdir -p prebuiltlibs/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt prebuiltlibs/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/cmds/idmap2/libidmap2_policies/include/ prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/include
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2 prebuiltlibs/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/cmds/idmap2/include/ prebuiltlibs/frameworks/base/cmds/idmap2/include
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/idmap2/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2 prebuiltlibs/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d prebuiltlibs/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d
mkdir -p prebuiltlibs/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a prebuiltlibs/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a
mkdir -p prebuiltlibs/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler prebuiltlibs/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/include_priv
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/incident/include_priv/ prebuiltlibs/frameworks/base/libs/incident/include_priv
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/cmds/incident/incident/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/incident/incident/android_x86_64/incident prebuiltlibs/frameworks/base/cmds/incident/incident/android_x86_64/incident
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/incident/include/ prebuiltlibs/frameworks/base/libs/incident/include
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libs/services/libservices/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so prebuiltlibs/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so
mkdir -p prebuiltlibs/frameworks/base/libs/services/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/services/include/ prebuiltlibs/frameworks/base/libs/services/include
mkdir -p prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a
mkdir -p prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a
mkdir -p prebuiltlibs/frameworks/base/libs/storage/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/storage/include/ prebuiltlibs/frameworks/base/libs/storage/include
mkdir -p prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so
mkdir -p prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so
mkdir -p prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so

printf "cc_prebuilt_library_shared {\n  name: \"lib-platform-compat-native-api\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"aidl\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib-platform-compat-native-api.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/android/Android.bp
printf "cc_prebuilt_library {\n  name: \"libandroidfw\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libutils\",\"libziparchive\"],\n      shared_libs: [\"libz\"],\n    },\n    android: {\n      shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"libcutils\",\"libincfs\",\"libutils\",\"libz\"],\n      static_libs: [\"libziparchive_for_incfs\"],\n      static: {\n        enabled: false,\n      },\n    },\n    linux_glibc: {\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libz\"],\n  static_libs: [\"libincfs-utils\"],\n  whole_static_libs: [\"libincfs-utils\"],\n  export_static_lib_headers: [\"libincfs-utils\"],\n  sanitize: {\n    blocklist: \"libandroidfw_blocklist.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libandroidfw.a\"],\n  },\n  shared: {\n    srcs: [\"libandroidfw.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/libs/androidfw/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaapt\",\n  static_libs: [\"libandroidfw\",\"libpng\",\"libutils\",\"liblog\",\"libcutils\",\"libexpat\",\"libziparchive\",\"libbase\",\"libz\"],\n  group_static_libs: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libaapt.a\"],\n}\ncc_prebuilt_binary {\n  name: \"aapt\",\n  group_static_libs: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  use_version_lib: true,\n  dist: {\n    targets: [\"aapt2_artifacts\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aapt\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/aapt/Android.bp
printf "cc_prebuilt_library {\n  name: \"libidmap2_policies\",\n  host_supported: true,\n  export_include_dirs: [\"libidmap2_policies/include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libidmap2_policies.a\"],\n  },\n  shared: {\n    srcs: [\"libidmap2_policies.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libidmap2\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n      static_libs: [\"libidmap2_protos\"],\n      shared_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2_policies\",\"libidmap2_protos\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidmap2.so\"],\n}\ncc_prebuilt_binary {\n  name: \"idmap2\",\n  host_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"liblog\",\"libprotobuf-cpp-lite\",\"libutils\",\"libziparchive\"],\n      shared_libs: [\"libz\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idmap2\"],\n}\ncc_prebuilt_binary {\n  name: \"idmap2d\",\n  host_supported: false,\n  shared_libs: [\"libandroidfw\",\"libbase\",\"libbinder\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libziparchive\"],\n  init_rc: [\"idmap2d/idmap2d.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idmap2d\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/idmap2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaapt2\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  static_libs: [\"libandroidfw\",\"libutils\",\"liblog\",\"libcutils\",\"libexpat\",\"libziparchive\",\"libpng\",\"libbase\",\"libprotobuf-cpp-full\",\"libz\",\"libbuildversion\",\"libidmap2_policies\"],\n  stl: \"libc++_static\",\n  group_static_libs: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libaapt2.a\"],\n}\ncc_prebuilt_binary {\n  name: \"aapt2\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  stl: \"libc++_static\",\n  group_static_libs: true,\n  use_version_lib: true,\n  dist: {\n    targets: [\"aapt2_artifacts\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aapt2\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/aapt2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libviewcompiler\",\n  shared_libs: [\"libbase\",\"slicer\"],\n  static_libs: [\"libcutils\",\"libtinyxml2\",\"liblog\",\"libutils\",\"libziparchive\",\"libz\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libviewcompiler.a\"],\n}\ncc_prebuilt_binary {\n  name: \"viewcompiler\",\n  shared_libs: [\"libbase\",\"slicer\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"viewcompiler\"],\n}\n" >> prebuiltlibs/frameworks/base/startop/view_compiler/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libincidentpriv\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libplatformprotos\"],\n  whole_static_libs: [\"libincidentcompanion\"],\n  export_include_dirs: [\"include_priv\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincidentpriv.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libincident\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\",\"libincidentpriv\"],\n  export_include_dirs: [\"include\"],\n  stubs: {\n    symbol_file: \"libincident.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincident.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/incident/Android.bp
printf "cc_prebuilt_binary {\n  name: \"incident\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libincidentpriv\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"incident\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/incident/Android.bp
printf "cc_prebuilt_library {\n  name: \"libincremental_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincremental_aidl-cpp.a\"],\n}\ncc_prebuilt_library {\n  name: \"libdataloader_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libincremental_aidl-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdataloader_aidl-cpp.a\"],\n}\ncc_prebuilt_library {\n  name: \"libincremental_manager_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libincremental_aidl-cpp\",\"libdataloader_aidl-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincremental_manager_aidl-cpp.a\"],\n}\n" >> prebuiltlibs/frameworks/base/core/java/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libservices\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libutils\"],\n  header_libs: [\"libbase_headers\"],\n  export_include_dirs: [\"include\"],\n  export_header_lib_headers: [\"libbase_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libservices.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/services/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstorage\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstorage.a\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/storage/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libtracingproxy\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtracingproxy.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/tracingproxy/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libwebviewchromium_loader\",\n  shared_libs: [\"libdl\",\"liblog\",\"libnativeloader\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebviewchromium_loader.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/webview/loader/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-9
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-9.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/Reactive-Extensions/RxCpp/'
du -ah -d1 external/Reactive-Extensions/RxCpp/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libbrillo/'
du -ah -d1 external/libbrillo/|sort -rh
echo 'external/libchrome/'
du -ah -d1 external/libchrome/|sort -rh
echo 'external/libxml2/'
du -ah -d1 external/libxml2/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/puffin/'
du -ah -d1 external/puffin/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/crates/futures/'
du -ah -d1 external/rust/crates/futures/|sort -rh
echo 'external/rust/crates/grpcio-sys/'
du -ah -d1 external/rust/crates/grpcio-sys/|sort -rh
echo 'external/rust/crates/hashlink/'
du -ah -d1 external/rust/crates/hashlink/|sort -rh
echo 'external/rust/crates/libsqlite3-sys/'
du -ah -d1 external/rust/crates/libsqlite3-sys/|sort -rh
echo 'external/rust/crates/rand/'
du -ah -d1 external/rust/crates/rand/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/scrypt/'
du -ah -d1 external/scrypt/|sort -rh
echo 'external/selinux/'
du -ah -d1 external/selinux/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/sqlite/'
du -ah -d1 external/sqlite/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/hardware/interfaces/'
du -ah -d1 frameworks/hardware/interfaces/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'hardware/libhardware_legacy/'
du -ah -d1 hardware/libhardware_legacy/|sort -rh
echo 'hardware/nxp/nfc/'
du -ah -d1 hardware/nxp/nfc/|sort -rh
echo 'hardware/nxp/secure_element/'
du -ah -d1 hardware/nxp/secure_element/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
echo 'packages/modules/NeuralNetworks/'
du -ah -d1 packages/modules/NeuralNetworks/|sort -rh
echo 'packages/modules/StatsD/'
du -ah -d1 packages/modules/StatsD/|sort -rh
echo 'packages/modules/Virtualization/'
du -ah -d1 packages/modules/Virtualization/|sort -rh
echo 'packages/modules/adb/'
du -ah -d1 packages/modules/adb/|sort -rh
echo 'packages/modules/common/'
du -ah -d1 packages/modules/common/|sort -rh
echo 'prebuilts/build-tools/'
du -ah -d1 prebuilts/build-tools/|sort -rh
echo 'prebuilts/clang-tools/'
du -ah -d1 prebuilts/clang-tools/|sort -rh
echo 'prebuilts/clang/host/linux-x86/'
du -ah -d1 prebuilts/clang/host/linux-x86/|sort -rh
echo 'prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/'
du -ah -d1 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/|sort -rh
echo 'prebuilts/jdk/jdk11/'
du -ah -d1 prebuilts/jdk/jdk11/|sort -rh
echo 'prebuilts/jdk/jdk8/'
du -ah -d1 prebuilts/jdk/jdk8/|sort -rh
echo 'prebuilts/misc/'
du -ah -d1 prebuilts/misc/|sort -rh
echo 'prebuilts/ndk/'
du -ah -d1 prebuilts/ndk/|sort -rh
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'prebuilts/sdk/'
du -ah -d1 prebuilts/sdk/|sort -rh
echo 'system/apex/'
du -ah -d1 system/apex/|sort -rh
echo 'system/bt/'
du -ah -d1 system/bt/|sort -rh
echo 'system/connectivity/wificond/'
du -ah -d1 system/connectivity/wificond/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/extras/'
du -ah -d1 system/extras/|sort -rh
echo 'system/gsid/'
du -ah -d1 system/gsid/|sort -rh
echo 'system/hardware/interfaces/'
du -ah -d1 system/hardware/interfaces/|sort -rh
echo 'system/hwservicemanager/'
du -ah -d1 system/hwservicemanager/|sort -rh
echo 'system/incremental_delivery/'
du -ah -d1 system/incremental_delivery/|sort -rh
echo 'system/iorap/'
du -ah -d1 system/iorap/|sort -rh
echo 'system/keymaster/'
du -ah -d1 system/keymaster/|sort -rh
echo 'system/libbase/'
du -ah -d1 system/libbase/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/libsysprop/'
du -ah -d1 system/libsysprop/|sort -rh
echo 'system/libvintf/'
du -ah -d1 system/libvintf/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/memory/libmemtrack/'
du -ah -d1 system/memory/libmemtrack/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/security/'
du -ah -d1 system/security/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'system/tools/xsdc/'
du -ah -d1 system/tools/xsdc/|sort -rh
echo 'system/vold/'
du -ah -d1 system/vold/|sort -rh
echo 'prebuiltlibs/art/'
du -ah -d1 prebuiltlibs/art/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/bootable/recovery/'
du -ah -d1 prebuiltlibs/bootable/recovery/|sort -rh
echo 'prebuiltlibs/device/generic/goldfish-opengl/'
du -ah -d1 prebuiltlibs/device/generic/goldfish-opengl/|sort -rh
echo 'prebuiltlibs/device/google/cuttlefish/'
du -ah -d1 prebuiltlibs/device/google/cuttlefish/|sort -rh
echo 'prebuiltlibs/external/OpenCSD/'
du -ah -d1 prebuiltlibs/external/OpenCSD/|sort -rh
echo 'prebuiltlibs/external/Reactive-Extensions/RxCpp/'
du -ah -d1 prebuiltlibs/external/Reactive-Extensions/RxCpp/|sort -rh
echo 'prebuiltlibs/external/aac/'
du -ah -d1 prebuiltlibs/external/aac/|sort -rh
echo 'prebuiltlibs/external/adhd/'
du -ah -d1 prebuiltlibs/external/adhd/|sort -rh
echo 'prebuiltlibs/external/android-clat/'
du -ah -d1 prebuiltlibs/external/android-clat/|sort -rh
echo 'prebuiltlibs/external/angle/'
du -ah -d1 prebuiltlibs/external/angle/|sort -rh
echo 'prebuiltlibs/external/arm-optimized-routines/'
du -ah -d1 prebuiltlibs/external/arm-optimized-routines/|sort -rh
echo 'prebuiltlibs/external/avb/'
du -ah -d1 prebuiltlibs/external/avb/|sort -rh
echo 'prebuiltlibs/external/bc/'
du -ah -d1 prebuiltlibs/external/bc/|sort -rh
echo 'prebuiltlibs/external/bcc/'
du -ah -d1 prebuiltlibs/external/bcc/|sort -rh
echo 'prebuiltlibs/external/boringssl/'
du -ah -d1 prebuiltlibs/external/boringssl/|sort -rh
echo 'prebuiltlibs/external/brotli/'
du -ah -d1 prebuiltlibs/external/brotli/|sort -rh
echo 'prebuiltlibs/external/bsdiff/'
du -ah -d1 prebuiltlibs/external/bsdiff/|sort -rh
echo 'prebuiltlibs/external/bzip2/'
du -ah -d1 prebuiltlibs/external/bzip2/|sort -rh
echo 'prebuiltlibs/external/cblas/'
du -ah -d1 prebuiltlibs/external/cblas/|sort -rh
echo 'prebuiltlibs/external/clang/'
du -ah -d1 prebuiltlibs/external/clang/|sort -rh
echo 'prebuiltlibs/external/cn-cbor/'
du -ah -d1 prebuiltlibs/external/cn-cbor/|sort -rh
echo 'prebuiltlibs/external/compiler-rt/'
du -ah -d1 prebuiltlibs/external/compiler-rt/|sort -rh
echo 'prebuiltlibs/external/conscrypt/'
du -ah -d1 prebuiltlibs/external/conscrypt/|sort -rh
echo 'prebuiltlibs/external/cpu_features/'
du -ah -d1 prebuiltlibs/external/cpu_features/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
echo 'prebuiltlibs/external/curl/'
du -ah -d1 prebuiltlibs/external/curl/|sort -rh
echo 'prebuiltlibs/external/dng_sdk/'
du -ah -d1 prebuiltlibs/external/dng_sdk/|sort -rh
echo 'prebuiltlibs/external/dnsmasq/'
du -ah -d1 prebuiltlibs/external/dnsmasq/|sort -rh
echo 'prebuiltlibs/external/drm_hwcomposer/'
du -ah -d1 prebuiltlibs/external/drm_hwcomposer/|sort -rh
echo 'prebuiltlibs/external/dtc/'
du -ah -d1 prebuiltlibs/external/dtc/|sort -rh
echo 'prebuiltlibs/external/dynamic_depth/'
du -ah -d1 prebuiltlibs/external/dynamic_depth/|sort -rh
echo 'prebuiltlibs/external/e2fsprogs/'
du -ah -d1 prebuiltlibs/external/e2fsprogs/|sort -rh
echo 'prebuiltlibs/external/eigen/'
du -ah -d1 prebuiltlibs/external/eigen/|sort -rh
echo 'prebuiltlibs/external/erofs-utils/'
du -ah -d1 prebuiltlibs/external/erofs-utils/|sort -rh
echo 'prebuiltlibs/external/expat/'
du -ah -d1 prebuiltlibs/external/expat/|sort -rh
echo 'prebuiltlibs/external/f2fs-tools/'
du -ah -d1 prebuiltlibs/external/f2fs-tools/|sort -rh
echo 'prebuiltlibs/external/fdlibm/'
du -ah -d1 prebuiltlibs/external/fdlibm/|sort -rh
echo 'prebuiltlibs/external/fec/'
du -ah -d1 prebuiltlibs/external/fec/|sort -rh
echo 'prebuiltlibs/external/flac/'
du -ah -d1 prebuiltlibs/external/flac/|sort -rh
echo 'prebuiltlibs/external/flatbuffers/'
du -ah -d1 prebuiltlibs/external/flatbuffers/|sort -rh
echo 'prebuiltlibs/external/fmtlib/'
du -ah -d1 prebuiltlibs/external/fmtlib/|sort -rh
echo 'prebuiltlibs/external/freetype/'
du -ah -d1 prebuiltlibs/external/freetype/|sort -rh
echo 'prebuiltlibs/external/fsck_msdos/'
du -ah -d1 prebuiltlibs/external/fsck_msdos/|sort -rh
echo 'prebuiltlibs/external/fsverity-utils/'
du -ah -d1 prebuiltlibs/external/fsverity-utils/|sort -rh
echo 'prebuiltlibs/external/gemmlowp/'
du -ah -d1 prebuiltlibs/external/gemmlowp/|sort -rh
echo 'prebuiltlibs/external/gflags/'
du -ah -d1 prebuiltlibs/external/gflags/|sort -rh
echo 'prebuiltlibs/external/giflib/'
du -ah -d1 prebuiltlibs/external/giflib/|sort -rh
echo 'prebuiltlibs/external/google-fruit/'
du -ah -d1 prebuiltlibs/external/google-fruit/|sort -rh
echo 'prebuiltlibs/external/googletest/'
du -ah -d1 prebuiltlibs/external/googletest/|sort -rh
echo 'prebuiltlibs/external/gptfdisk/'
du -ah -d1 prebuiltlibs/external/gptfdisk/|sort -rh
echo 'prebuiltlibs/external/grpc-grpc/'
du -ah -d1 prebuiltlibs/external/grpc-grpc/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/harfbuzz_ng/'
du -ah -d1 prebuiltlibs/external/harfbuzz_ng/|sort -rh
echo 'prebuiltlibs/external/icing/'
du -ah -d1 prebuiltlibs/external/icing/|sort -rh
echo 'prebuiltlibs/external/icu/'
du -ah -d1 prebuiltlibs/external/icu/|sort -rh
echo 'prebuiltlibs/external/image_io/'
du -ah -d1 prebuiltlibs/external/image_io/|sort -rh
echo 'prebuiltlibs/external/iperf3/'
du -ah -d1 prebuiltlibs/external/iperf3/|sort -rh
echo 'prebuiltlibs/external/iproute2/'
du -ah -d1 prebuiltlibs/external/iproute2/|sort -rh
echo 'prebuiltlibs/external/ipsec-tools/'
du -ah -d1 prebuiltlibs/external/ipsec-tools/|sort -rh
echo 'prebuiltlibs/external/iptables/'
du -ah -d1 prebuiltlibs/external/iptables/|sort -rh
echo 'prebuiltlibs/external/iputils/'
du -ah -d1 prebuiltlibs/external/iputils/|sort -rh
echo 'prebuiltlibs/external/iw/'
du -ah -d1 prebuiltlibs/external/iw/|sort -rh
echo 'prebuiltlibs/external/jsmn/'
du -ah -d1 prebuiltlibs/external/jsmn/|sort -rh
echo 'prebuiltlibs/external/jsoncpp/'
du -ah -d1 prebuiltlibs/external/jsoncpp/|sort -rh
echo 'prebuiltlibs/external/kmod/'
du -ah -d1 prebuiltlibs/external/kmod/|sort -rh
echo 'prebuiltlibs/external/libavc/'
du -ah -d1 prebuiltlibs/external/libavc/|sort -rh
echo 'prebuiltlibs/external/libbrillo/'
du -ah -d1 prebuiltlibs/external/libbrillo/|sort -rh
echo 'prebuiltlibs/external/libcap/'
du -ah -d1 prebuiltlibs/external/libcap/|sort -rh
echo 'prebuiltlibs/external/libchrome/'
du -ah -d1 prebuiltlibs/external/libchrome/|sort -rh
echo 'prebuiltlibs/external/libcppbor/'
du -ah -d1 prebuiltlibs/external/libcppbor/|sort -rh
echo 'prebuiltlibs/external/libcups/'
du -ah -d1 prebuiltlibs/external/libcups/|sort -rh
echo 'prebuiltlibs/external/libcxx/'
du -ah -d1 prebuiltlibs/external/libcxx/|sort -rh
echo 'prebuiltlibs/external/libcxxabi/'
du -ah -d1 prebuiltlibs/external/libcxxabi/|sort -rh
echo 'prebuiltlibs/external/libdivsufsort/'
du -ah -d1 prebuiltlibs/external/libdivsufsort/|sort -rh
echo 'prebuiltlibs/external/libdrm/'
du -ah -d1 prebuiltlibs/external/libdrm/|sort -rh
echo 'prebuiltlibs/external/libepoxy/'
du -ah -d1 prebuiltlibs/external/libepoxy/|sort -rh
echo 'prebuiltlibs/external/libevent/'
du -ah -d1 prebuiltlibs/external/libevent/|sort -rh
echo 'prebuiltlibs/external/libexif/'
du -ah -d1 prebuiltlibs/external/libexif/|sort -rh
echo 'prebuiltlibs/external/libffi/'
du -ah -d1 prebuiltlibs/external/libffi/|sort -rh
echo 'prebuiltlibs/external/libgav1/'
du -ah -d1 prebuiltlibs/external/libgav1/|sort -rh
echo 'prebuiltlibs/external/libgsm/'
du -ah -d1 prebuiltlibs/external/libgsm/|sort -rh
echo 'prebuiltlibs/external/libhevc/'
du -ah -d1 prebuiltlibs/external/libhevc/|sort -rh
echo 'prebuiltlibs/external/libjpeg-turbo/'
du -ah -d1 prebuiltlibs/external/libjpeg-turbo/|sort -rh
echo 'prebuiltlibs/external/libldac/'
du -ah -d1 prebuiltlibs/external/libldac/|sort -rh
echo 'prebuiltlibs/external/libmpeg2/'
du -ah -d1 prebuiltlibs/external/libmpeg2/|sort -rh
echo 'prebuiltlibs/external/libnl/'
du -ah -d1 prebuiltlibs/external/libnl/|sort -rh
echo 'prebuiltlibs/external/libogg/'
du -ah -d1 prebuiltlibs/external/libogg/|sort -rh
echo 'prebuiltlibs/external/libopus/'
du -ah -d1 prebuiltlibs/external/libopus/|sort -rh
echo 'prebuiltlibs/external/libpcap/'
du -ah -d1 prebuiltlibs/external/libpcap/|sort -rh
echo 'prebuiltlibs/external/libpng/'
du -ah -d1 prebuiltlibs/external/libpng/|sort -rh
echo 'prebuiltlibs/external/libtextclassifier/'
du -ah -d1 prebuiltlibs/external/libtextclassifier/|sort -rh
echo 'prebuiltlibs/external/libvpx/'
du -ah -d1 prebuiltlibs/external/libvpx/|sort -rh
echo 'prebuiltlibs/external/libxml2/'
du -ah -d1 prebuiltlibs/external/libxml2/|sort -rh
echo 'prebuiltlibs/external/libyuv/'
du -ah -d1 prebuiltlibs/external/libyuv/|sort -rh
echo 'prebuiltlibs/external/llvm/'
du -ah -d1 prebuiltlibs/external/llvm/|sort -rh
echo 'prebuiltlibs/external/lz4/'
du -ah -d1 prebuiltlibs/external/lz4/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
echo 'prebuiltlibs/external/mdnsresponder/'
du -ah -d1 prebuiltlibs/external/mdnsresponder/|sort -rh
echo 'prebuiltlibs/external/mesa3d/'
du -ah -d1 prebuiltlibs/external/mesa3d/|sort -rh
echo 'prebuiltlibs/external/minigbm/'
du -ah -d1 prebuiltlibs/external/minigbm/|sort -rh
echo 'prebuiltlibs/external/minijail/'
du -ah -d1 prebuiltlibs/external/minijail/|sort -rh
echo 'prebuiltlibs/external/mksh/'
du -ah -d1 prebuiltlibs/external/mksh/|sort -rh
echo 'prebuiltlibs/external/modp_b64/'
du -ah -d1 prebuiltlibs/external/modp_b64/|sort -rh
echo 'prebuiltlibs/external/mtpd/'
du -ah -d1 prebuiltlibs/external/mtpd/|sort -rh
echo 'prebuiltlibs/external/nanopb-c/'
du -ah -d1 prebuiltlibs/external/nanopb-c/|sort -rh
echo 'prebuiltlibs/external/newfs_msdos/'
du -ah -d1 prebuiltlibs/external/newfs_msdos/|sort -rh
echo 'prebuiltlibs/external/oj-libjdwp/'
du -ah -d1 prebuiltlibs/external/oj-libjdwp/|sort -rh
echo 'prebuiltlibs/external/one-true-awk/'
du -ah -d1 prebuiltlibs/external/one-true-awk/|sort -rh
echo 'prebuiltlibs/external/parameter-framework/'
du -ah -d1 prebuiltlibs/external/parameter-framework/|sort -rh
echo 'prebuiltlibs/external/pcre/'
du -ah -d1 prebuiltlibs/external/pcre/|sort -rh
echo 'prebuiltlibs/external/pdfium/'
du -ah -d1 prebuiltlibs/external/pdfium/|sort -rh
echo 'prebuiltlibs/external/perfetto/'
du -ah -d1 prebuiltlibs/external/perfetto/|sort -rh
echo 'prebuiltlibs/external/pffft/'
du -ah -d1 prebuiltlibs/external/pffft/|sort -rh
echo 'prebuiltlibs/external/piex/'
du -ah -d1 prebuiltlibs/external/piex/|sort -rh
echo 'prebuiltlibs/external/ppp/'
du -ah -d1 prebuiltlibs/external/ppp/|sort -rh
echo 'prebuiltlibs/external/protobuf/'
du -ah -d1 prebuiltlibs/external/protobuf/|sort -rh
echo 'prebuiltlibs/external/puffin/'
du -ah -d1 prebuiltlibs/external/puffin/|sort -rh
echo 'prebuiltlibs/external/python/cpython2/'
du -ah -d1 prebuiltlibs/external/python/cpython2/|sort -rh
echo 'prebuiltlibs/external/rnnoise/'
du -ah -d1 prebuiltlibs/external/rnnoise/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ahash/'
du -ah -d1 prebuiltlibs/external/rust/crates/ahash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/aho-corasick/'
du -ah -d1 prebuiltlibs/external/rust/crates/aho-corasick/|sort -rh
echo 'prebuiltlibs/external/rust/crates/android_log-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/android_log-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/android_logger/'
du -ah -d1 prebuiltlibs/external/rust/crates/android_logger/|sort -rh
echo 'prebuiltlibs/external/rust/crates/anyhow/'
du -ah -d1 prebuiltlibs/external/rust/crates/anyhow/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-task/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-task/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-trait/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-trait/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bindgen/'
du -ah -d1 prebuiltlibs/external/rust/crates/bindgen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bitflags/'
du -ah -d1 prebuiltlibs/external/rust/crates/bitflags/|sort -rh
echo 'prebuiltlibs/external/rust/crates/byteorder/'
du -ah -d1 prebuiltlibs/external/rust/crates/byteorder/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bytes/'
du -ah -d1 prebuiltlibs/external/rust/crates/bytes/|sort -rh
echo 'prebuiltlibs/external/rust/crates/cexpr/'
du -ah -d1 prebuiltlibs/external/rust/crates/cexpr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/cfg-if/'
du -ah -d1 prebuiltlibs/external/rust/crates/cfg-if/|sort -rh
echo 'prebuiltlibs/external/rust/crates/chrono/'
du -ah -d1 prebuiltlibs/external/rust/crates/chrono/|sort -rh
echo 'prebuiltlibs/external/rust/crates/clang-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/clang-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/clap/'
du -ah -d1 prebuiltlibs/external/rust/crates/clap/|sort -rh
echo 'prebuiltlibs/external/rust/crates/codespan-reporting/'
du -ah -d1 prebuiltlibs/external/rust/crates/codespan-reporting/|sort -rh
echo 'prebuiltlibs/external/rust/crates/crc32fast/'
du -ah -d1 prebuiltlibs/external/rust/crates/crc32fast/|sort -rh
echo 'prebuiltlibs/external/rust/crates/downcast-rs/'
du -ah -d1 prebuiltlibs/external/rust/crates/downcast-rs/|sort -rh
echo 'prebuiltlibs/external/rust/crates/either/'
du -ah -d1 prebuiltlibs/external/rust/crates/either/|sort -rh
echo 'prebuiltlibs/external/rust/crates/env_logger/'
du -ah -d1 prebuiltlibs/external/rust/crates/env_logger/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-streaming-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-streaming-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/flate2/'
du -ah -d1 prebuiltlibs/external/rust/crates/flate2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-channel/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-channel/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-core/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-executor/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-executor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-io/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-io/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-macro/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-macro/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-sink/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-sink/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-task/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-task/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-util/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-util/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures/|sort -rh
echo 'prebuiltlibs/external/rust/crates/getrandom/'
du -ah -d1 prebuiltlibs/external/rust/crates/getrandom/|sort -rh
echo 'prebuiltlibs/external/rust/crates/glob/'
du -ah -d1 prebuiltlibs/external/rust/crates/glob/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-compiler/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-compiler/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/hashbrown/'
du -ah -d1 prebuiltlibs/external/rust/crates/hashbrown/|sort -rh
echo 'prebuiltlibs/external/rust/crates/hashlink/'
du -ah -d1 prebuiltlibs/external/rust/crates/hashlink/|sort -rh
echo 'prebuiltlibs/external/rust/crates/heck/'
du -ah -d1 prebuiltlibs/external/rust/crates/heck/|sort -rh
echo 'prebuiltlibs/external/rust/crates/instant/'
du -ah -d1 prebuiltlibs/external/rust/crates/instant/|sort -rh
echo 'prebuiltlibs/external/rust/crates/intrusive-collections/'
du -ah -d1 prebuiltlibs/external/rust/crates/intrusive-collections/|sort -rh
echo 'prebuiltlibs/external/rust/crates/itoa/'
du -ah -d1 prebuiltlibs/external/rust/crates/itoa/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazy_static/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazy_static/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazycell/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazycell/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libc/'
du -ah -d1 prebuiltlibs/external/rust/crates/libc/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libloading/'
du -ah -d1 prebuiltlibs/external/rust/crates/libloading/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libsqlite3-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/libsqlite3-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libz-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/libz-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lock_api/'
du -ah -d1 prebuiltlibs/external/rust/crates/lock_api/|sort -rh
echo 'prebuiltlibs/external/rust/crates/log/'
du -ah -d1 prebuiltlibs/external/rust/crates/log/|sort -rh
echo 'prebuiltlibs/external/rust/crates/macaddr/'
du -ah -d1 prebuiltlibs/external/rust/crates/macaddr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memchr/'
du -ah -d1 prebuiltlibs/external/rust/crates/memchr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memoffset/'
du -ah -d1 prebuiltlibs/external/rust/crates/memoffset/|sort -rh
echo 'prebuiltlibs/external/rust/crates/mio/'
du -ah -d1 prebuiltlibs/external/rust/crates/mio/|sort -rh
echo 'prebuiltlibs/external/rust/crates/nix/'
du -ah -d1 prebuiltlibs/external/rust/crates/nix/|sort -rh
echo 'prebuiltlibs/external/rust/crates/nom/'
du -ah -d1 prebuiltlibs/external/rust/crates/nom/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-integer/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-integer/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-traits/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-traits/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num_cpus/'
du -ah -d1 prebuiltlibs/external/rust/crates/num_cpus/|sort -rh
echo 'prebuiltlibs/external/rust/crates/parking_lot/'
du -ah -d1 prebuiltlibs/external/rust/crates/parking_lot/|sort -rh
echo 'prebuiltlibs/external/rust/crates/parking_lot_core/'
du -ah -d1 prebuiltlibs/external/rust/crates/parking_lot_core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/paste/'
du -ah -d1 prebuiltlibs/external/rust/crates/paste/|sort -rh
echo 'prebuiltlibs/external/rust/crates/peeking_take_while/'
du -ah -d1 prebuiltlibs/external/rust/crates/peeking_take_while/|sort -rh
echo 'prebuiltlibs/external/rust/crates/pin-project-lite/'
du -ah -d1 prebuiltlibs/external/rust/crates/pin-project-lite/|sort -rh
echo 'prebuiltlibs/external/rust/crates/pin-utils/'
du -ah -d1 prebuiltlibs/external/rust/crates/pin-utils/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ppv-lite86/'
du -ah -d1 prebuiltlibs/external/rust/crates/ppv-lite86/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error-attr/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error-attr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-hack/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-hack/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-nested/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-nested/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro2/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf-codegen/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf-codegen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf/|sort -rh
echo 'prebuiltlibs/external/rust/crates/quote/'
du -ah -d1 prebuiltlibs/external/rust/crates/quote/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rand/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rand_chacha/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand_chacha/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rand_core/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand_core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex-syntax/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex-syntax/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/remain/'
du -ah -d1 prebuiltlibs/external/rust/crates/remain/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rustc-hash/'
du -ah -d1 prebuiltlibs/external/rust/crates/rustc-hash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ryu/'
du -ah -d1 prebuiltlibs/external/rust/crates/ryu/|sort -rh
echo 'prebuiltlibs/external/rust/crates/scopeguard/'
du -ah -d1 prebuiltlibs/external/rust/crates/scopeguard/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde_derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde_derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde_json/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde_json/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shared_child/'
du -ah -d1 prebuiltlibs/external/rust/crates/shared_child/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/slab/'
du -ah -d1 prebuiltlibs/external/rust/crates/slab/|sort -rh
echo 'prebuiltlibs/external/rust/crates/smallvec/'
du -ah -d1 prebuiltlibs/external/rust/crates/smallvec/|sort -rh
echo 'prebuiltlibs/external/rust/crates/structopt-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/structopt-derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/structopt/'
du -ah -d1 prebuiltlibs/external/rust/crates/structopt/|sort -rh
echo 'prebuiltlibs/external/rust/crates/syn/'
du -ah -d1 prebuiltlibs/external/rust/crates/syn/|sort -rh
echo 'prebuiltlibs/external/rust/crates/termcolor/'
du -ah -d1 prebuiltlibs/external/rust/crates/termcolor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/textwrap/'
du -ah -d1 prebuiltlibs/external/rust/crates/textwrap/|sort -rh
echo 'prebuiltlibs/external/rust/crates/thiserror-impl/'
du -ah -d1 prebuiltlibs/external/rust/crates/thiserror-impl/|sort -rh
echo 'prebuiltlibs/external/rust/crates/thiserror/'
du -ah -d1 prebuiltlibs/external/rust/crates/thiserror/|sort -rh
echo 'prebuiltlibs/external/rust/crates/tokio-macros/'
du -ah -d1 prebuiltlibs/external/rust/crates/tokio-macros/|sort -rh
echo 'prebuiltlibs/external/rust/crates/tokio/'
du -ah -d1 prebuiltlibs/external/rust/crates/tokio/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/uuid/'
du -ah -d1 prebuiltlibs/external/rust/crates/uuid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/vmm_vhost/'
du -ah -d1 prebuiltlibs/external/rust/crates/vmm_vhost/|sort -rh
echo 'prebuiltlibs/external/rust/crates/which/'
du -ah -d1 prebuiltlibs/external/rust/crates/which/|sort -rh
echo 'prebuiltlibs/external/rust/crates/zip/'
du -ah -d1 prebuiltlibs/external/rust/crates/zip/|sort -rh
echo 'prebuiltlibs/external/rust/cxx/'
du -ah -d1 prebuiltlibs/external/rust/cxx/|sort -rh
echo 'prebuiltlibs/external/scrypt/'
du -ah -d1 prebuiltlibs/external/scrypt/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/sfntly/'
du -ah -d1 prebuiltlibs/external/sfntly/|sort -rh
echo 'prebuiltlibs/external/sonic/'
du -ah -d1 prebuiltlibs/external/sonic/|sort -rh
echo 'prebuiltlibs/external/sonivox/'
du -ah -d1 prebuiltlibs/external/sonivox/|sort -rh
echo 'prebuiltlibs/external/speex/'
du -ah -d1 prebuiltlibs/external/speex/|sort -rh
echo 'prebuiltlibs/external/sqlite/'
du -ah -d1 prebuiltlibs/external/sqlite/|sort -rh
echo 'prebuiltlibs/external/strace/'
du -ah -d1 prebuiltlibs/external/strace/|sort -rh
echo 'prebuiltlibs/external/swiftshader/'
du -ah -d1 prebuiltlibs/external/swiftshader/|sort -rh
echo 'prebuiltlibs/external/tcpdump/'
du -ah -d1 prebuiltlibs/external/tcpdump/|sort -rh
echo 'prebuiltlibs/external/tensorflow/'
du -ah -d1 prebuiltlibs/external/tensorflow/|sort -rh
echo 'prebuiltlibs/external/tinyalsa/'
du -ah -d1 prebuiltlibs/external/tinyalsa/|sort -rh
echo 'prebuiltlibs/external/tinyxml2/'
du -ah -d1 prebuiltlibs/external/tinyxml2/|sort -rh
echo 'prebuiltlibs/external/toybox/'
du -ah -d1 prebuiltlibs/external/toybox/|sort -rh
echo 'prebuiltlibs/external/tremolo/'
du -ah -d1 prebuiltlibs/external/tremolo/|sort -rh
echo 'prebuiltlibs/external/virglrenderer/'
du -ah -d1 prebuiltlibs/external/virglrenderer/|sort -rh
echo 'prebuiltlibs/external/vixl/'
du -ah -d1 prebuiltlibs/external/vixl/|sort -rh
echo 'prebuiltlibs/external/vm_tools/p9/'
du -ah -d1 prebuiltlibs/external/vm_tools/p9/|sort -rh
echo 'prebuiltlibs/external/wayland/'
du -ah -d1 prebuiltlibs/external/wayland/|sort -rh
echo 'prebuiltlibs/external/webp/'
du -ah -d1 prebuiltlibs/external/webp/|sort -rh
echo 'prebuiltlibs/external/webrtc/'
du -ah -d1 prebuiltlibs/external/webrtc/|sort -rh
echo 'prebuiltlibs/external/xz-embedded/'
du -ah -d1 prebuiltlibs/external/xz-embedded/|sort -rh
echo 'prebuiltlibs/external/zlib/'
du -ah -d1 prebuiltlibs/external/zlib/|sort -rh
echo 'prebuiltlibs/external/zopfli/'
du -ah -d1 prebuiltlibs/external/zopfli/|sort -rh
echo 'prebuiltlibs/external/zstd/'
du -ah -d1 prebuiltlibs/external/zstd/|sort -rh
echo 'prebuiltlibs/frameworks/av/'
du -ah -d1 prebuiltlibs/frameworks/av/|sort -rh
echo 'prebuiltlibs/frameworks/base/'
du -ah -d1 prebuiltlibs/frameworks/base/|sort -rh
echo 'prebuiltlibs/frameworks/compile/libbcc/'
du -ah -d1 prebuiltlibs/frameworks/compile/libbcc/|sort -rh
echo 'prebuiltlibs/frameworks/compile/mclinker/'
du -ah -d1 prebuiltlibs/frameworks/compile/mclinker/|sort -rh
echo 'prebuiltlibs/frameworks/compile/slang/'
du -ah -d1 prebuiltlibs/frameworks/compile/slang/|sort -rh
echo 'prebuiltlibs/frameworks/libs/modules-utils/'
du -ah -d1 prebuiltlibs/frameworks/libs/modules-utils/|sort -rh
echo 'prebuiltlibs/frameworks/libs/net/'
du -ah -d1 prebuiltlibs/frameworks/libs/net/|sort -rh
echo 'prebuiltlibs/frameworks/minikin/'
du -ah -d1 prebuiltlibs/frameworks/minikin/|sort -rh
echo 'prebuiltlibs/frameworks/native/'
du -ah -d1 prebuiltlibs/frameworks/native/|sort -rh
echo 'prebuiltlibs/frameworks/opt/net/wifi/'
du -ah -d1 prebuiltlibs/frameworks/opt/net/wifi/|sort -rh
echo 'prebuiltlibs/frameworks/proto_logging/'
du -ah -d1 prebuiltlibs/frameworks/proto_logging/|sort -rh
echo 'prebuiltlibs/frameworks/rs/'
du -ah -d1 prebuiltlibs/frameworks/rs/|sort -rh
echo 'prebuiltlibs/frameworks/wilhelm/'
du -ah -d1 prebuiltlibs/frameworks/wilhelm/|sort -rh
echo 'prebuiltlibs/hardware/google/camera/'
du -ah -d1 prebuiltlibs/hardware/google/camera/|sort -rh
echo 'prebuiltlibs/hardware/interfaces/'
du -ah -d1 prebuiltlibs/hardware/interfaces/|sort -rh
echo 'prebuiltlibs/hardware/libhardware/'
du -ah -d1 prebuiltlibs/hardware/libhardware/|sort -rh
echo 'prebuiltlibs/hardware/libhardware_legacy/'
du -ah -d1 prebuiltlibs/hardware/libhardware_legacy/|sort -rh
echo 'prebuiltlibs/hardware/ril/'
du -ah -d1 prebuiltlibs/hardware/ril/|sort -rh
echo 'prebuiltlibs/libcore/'
du -ah -d1 prebuiltlibs/libcore/|sort -rh
echo 'prebuiltlibs/libnativehelper/'
du -ah -d1 prebuiltlibs/libnativehelper/|sort -rh
echo 'prebuiltlibs/packages/apps/Messaging/'
du -ah -d1 prebuiltlibs/packages/apps/Messaging/|sort -rh
echo 'prebuiltlibs/packages/inputmethods/LatinIME/'
du -ah -d1 prebuiltlibs/packages/inputmethods/LatinIME/|sort -rh
echo 'prebuiltlibs/packages/modules/Connectivity/'
du -ah -d1 prebuiltlibs/packages/modules/Connectivity/|sort -rh
echo 'prebuiltlibs/packages/modules/DnsResolver/'
du -ah -d1 prebuiltlibs/packages/modules/DnsResolver/|sort -rh
echo 'prebuiltlibs/packages/modules/Gki/'
du -ah -d1 prebuiltlibs/packages/modules/Gki/|sort -rh
echo 'prebuiltlibs/packages/modules/NeuralNetworks/'
du -ah -d1 prebuiltlibs/packages/modules/NeuralNetworks/|sort -rh
echo 'prebuiltlibs/packages/modules/SdkExtensions/'
du -ah -d1 prebuiltlibs/packages/modules/SdkExtensions/|sort -rh
echo 'prebuiltlibs/packages/modules/StatsD/'
du -ah -d1 prebuiltlibs/packages/modules/StatsD/|sort -rh
echo 'prebuiltlibs/packages/modules/Virtualization/'
du -ah -d1 prebuiltlibs/packages/modules/Virtualization/|sort -rh
echo 'prebuiltlibs/packages/modules/adb/'
du -ah -d1 prebuiltlibs/packages/modules/adb/|sort -rh
echo 'prebuiltlibs/packages/modules/common/'
du -ah -d1 prebuiltlibs/packages/modules/common/|sort -rh
echo 'prebuiltlibs/system/apex/'
du -ah -d1 prebuiltlibs/system/apex/|sort -rh
echo 'prebuiltlibs/system/bpf/'
du -ah -d1 prebuiltlibs/system/bpf/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
echo 'prebuiltlibs/system/connectivity/wificond/'
du -ah -d1 prebuiltlibs/system/connectivity/wificond/|sort -rh
echo 'prebuiltlibs/system/core/'
du -ah -d1 prebuiltlibs/system/core/|sort -rh
echo 'prebuiltlibs/system/extras/'
du -ah -d1 prebuiltlibs/system/extras/|sort -rh
echo 'prebuiltlibs/system/gatekeeper/'
du -ah -d1 prebuiltlibs/system/gatekeeper/|sort -rh
echo 'prebuiltlibs/system/gsid/'
du -ah -d1 prebuiltlibs/system/gsid/|sort -rh
echo 'prebuiltlibs/system/hardware/interfaces/'
du -ah -d1 prebuiltlibs/system/hardware/interfaces/|sort -rh
echo 'prebuiltlibs/system/hwservicemanager/'
du -ah -d1 prebuiltlibs/system/hwservicemanager/|sort -rh
echo 'prebuiltlibs/system/incremental_delivery/'
du -ah -d1 prebuiltlibs/system/incremental_delivery/|sort -rh
echo 'prebuiltlibs/system/iorap/'
du -ah -d1 prebuiltlibs/system/iorap/|sort -rh
echo 'prebuiltlibs/system/keymaster/'
du -ah -d1 prebuiltlibs/system/keymaster/|sort -rh
echo 'prebuiltlibs/system/libartpalette/'
du -ah -d1 prebuiltlibs/system/libartpalette/|sort -rh
echo 'prebuiltlibs/system/libbase/'
du -ah -d1 prebuiltlibs/system/libbase/|sort -rh
echo 'prebuiltlibs/system/libfmq/'
du -ah -d1 prebuiltlibs/system/libfmq/|sort -rh
echo 'prebuiltlibs/system/libhidl/'
du -ah -d1 prebuiltlibs/system/libhidl/|sort -rh
echo 'prebuiltlibs/system/libhwbinder/'
du -ah -d1 prebuiltlibs/system/libhwbinder/|sort -rh
echo 'prebuiltlibs/system/libprocinfo/'
du -ah -d1 prebuiltlibs/system/libprocinfo/|sort -rh
echo 'prebuiltlibs/system/libvintf/'
du -ah -d1 prebuiltlibs/system/libvintf/|sort -rh
echo 'prebuiltlibs/system/libziparchive/'
du -ah -d1 prebuiltlibs/system/libziparchive/|sort -rh
echo 'prebuiltlibs/system/linkerconfig/'
du -ah -d1 prebuiltlibs/system/linkerconfig/|sort -rh
echo 'prebuiltlibs/system/logging/'
du -ah -d1 prebuiltlibs/system/logging/|sort -rh
echo 'prebuiltlibs/system/media/'
du -ah -d1 prebuiltlibs/system/media/|sort -rh
echo 'prebuiltlibs/system/memory/libdmabufheap/'
du -ah -d1 prebuiltlibs/system/memory/libdmabufheap/|sort -rh
echo 'prebuiltlibs/system/memory/libion/'
du -ah -d1 prebuiltlibs/system/memory/libion/|sort -rh
echo 'prebuiltlibs/system/memory/libmeminfo/'
du -ah -d1 prebuiltlibs/system/memory/libmeminfo/|sort -rh
echo 'prebuiltlibs/system/memory/libmemtrack/'
du -ah -d1 prebuiltlibs/system/memory/libmemtrack/|sort -rh
echo 'prebuiltlibs/system/memory/libmemunreachable/'
du -ah -d1 prebuiltlibs/system/memory/libmemunreachable/|sort -rh
echo 'prebuiltlibs/system/memory/lmkd/'
du -ah -d1 prebuiltlibs/system/memory/lmkd/|sort -rh
echo 'prebuiltlibs/system/netd/'
du -ah -d1 prebuiltlibs/system/netd/|sort -rh
echo 'prebuiltlibs/system/nfc/'
du -ah -d1 prebuiltlibs/system/nfc/|sort -rh
echo 'prebuiltlibs/system/security/'
du -ah -d1 prebuiltlibs/system/security/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
echo 'prebuiltlibs/system/server_configurable_flags/'
du -ah -d1 prebuiltlibs/system/server_configurable_flags/|sort -rh
echo 'prebuiltlibs/system/timezone/'
du -ah -d1 prebuiltlibs/system/timezone/|sort -rh
echo 'prebuiltlibs/system/tools/aidl/'
du -ah -d1 prebuiltlibs/system/tools/aidl/|sort -rh
echo 'prebuiltlibs/system/tools/hidl/'
du -ah -d1 prebuiltlibs/system/tools/hidl/|sort -rh
echo 'prebuiltlibs/system/tools/mkbootimg/'
du -ah -d1 prebuiltlibs/system/tools/mkbootimg/|sort -rh
echo 'prebuiltlibs/system/tools/sysprop/'
du -ah -d1 prebuiltlibs/system/tools/sysprop/|sort -rh
echo 'prebuiltlibs/system/tools/xsdc/'
du -ah -d1 prebuiltlibs/system/tools/xsdc/|sort -rh
echo 'prebuiltlibs/system/unwinding/'
du -ah -d1 prebuiltlibs/system/unwinding/|sort -rh
echo 'prebuiltlibs/system/update_engine/'
du -ah -d1 prebuiltlibs/system/update_engine/|sort -rh
echo 'prebuiltlibs/system/vold/'
du -ah -d1 prebuiltlibs/system/vold/|sort -rh
echo 'prebuiltlibs/test/vts-testcase/hal/'
du -ah -d1 prebuiltlibs/test/vts-testcase/hal/|sort -rh
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
echo 'prebuiltlibs/tools/security/'
du -ah -d1 prebuiltlibs/tools/security/|sort -rh
