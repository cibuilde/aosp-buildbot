
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/native"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libhidl
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building libtrace_proto^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtrace_proto,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtrace_proto^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtrace_proto^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libadbd_auth^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_auth,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libadbd_auth^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_auth,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared/addition_copy_files.output

echo "building libadbd_auth^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_auth,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libadbd_auth^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared/addition_copy_files.output

echo "building libbinder^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbinder,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libbinder^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libbinder^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^linux_glibc_x86_64_static/addition_copy_files.output

echo "building binderthreadstateutilstest@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja binderthreadstateutilstest@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/1.0/binderthreadstateutilstest@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/binderthreadstateutilstest@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/1.0/binderthreadstateutilstest@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/binderthreadstateutilstest@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/1.0/binderthreadstateutilstest@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/1.0/binderthreadstateutilstest@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building libgui_aidl_static^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libgui_aidl_static,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libgui_aidl_static^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libgui_aidl_static,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libgui_aidl_static^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libgui_aidl_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/addition_copy_files.output

echo "building libgui_aidl_static^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libgui_aidl_static,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libgui_aidl_static^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/addition_copy_files.output

echo "building libinput^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libinput,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libinput^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libinput^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^linux_glibc_x86_64_static/addition_copy_files.output

echo "building framework-permission-aidl-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/framework-permission-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/framework-permission-aidl-cpp-source^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/addition_copy_files.output

echo "building framework-permission-aidl-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-permission-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/framework-permission-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/framework-permission-aidl-java-source^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-java-source^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-java-source^/addition_copy_files.output

echo "building libui-types^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libui-types,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libui-types^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libui-types^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libui-types^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libui-types,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libui-types^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libui-types^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libtimestats_atoms_proto^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtimestats_atoms_proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_atoms_proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_atoms_proto^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static/addition_copy_files.output

echo "building libtimestats_atoms_proto^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtimestats_atoms_proto,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_atoms_proto^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_atoms_proto^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_static/addition_copy_files.output

echo "building libtimestats_proto^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtimestats_proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libtimestats_proto^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static/addition_copy_files.output

echo "building libserviceutils^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libserviceutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libserviceutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/native/libserviceutils^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_vendor.31_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
