
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

echo "Preparing for frameworks/native"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/Gki
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libvintf
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/tools/hidl
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .

echo "building libidlcli^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libidlcli,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/libidlcli^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libidlcli^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/libidlcli^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libidlcli^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/libidlcli^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/libidlcli^android_x86_64_static/addition_copy_files.output

echo "building liblshal^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja liblshal,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/liblshal^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/liblshal^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/liblshal^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/liblshal^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/liblshal^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/liblshal^android_x86_64_static/addition_copy_files.output

echo "building libbinder_ndk_bindgen^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbinder_ndk_bindgen,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbinder_ndk_bindgen^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbinder_ndk_bindgen^android_x86_64_source.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source/addition_copy_files.output

echo "building libbinder_ndk_bindgen^android_x86_64_source_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbinder_ndk_bindgen,android_x86_64_source_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbinder_ndk_bindgen^android_x86_64_source_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbinder_ndk_bindgen^android_x86_64_source_apex10000.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source_apex10000 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source_apex10000/addition_copy_files.output

echo "building libdumputils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libdumputils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/dumputils/libdumputils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libdumputils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/dumputils/libdumputils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libdumputils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/dumputils/libdumputils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/dumputils/libdumputils^android_x86_64_static/addition_copy_files.output

echo "building libgralloctypes^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgralloctypes,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libgralloctypes^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgralloctypes,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libgralloctypes^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgralloctypes,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static/addition_copy_files.output

echo "building libgralloctypes^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgralloctypes,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libgralloctypes^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgralloctypes,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libgralloctypes^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_static/addition_copy_files.output

echo "building libnativewindow^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnativewindow,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libnativewindow^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libnativewindow^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_static/addition_copy_files.output

echo "building libnativewindow^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnativewindow,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libnativewindow^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libnativewindow^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_static/addition_copy_files.output

echo "building libbufferhub^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbufferhub,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbufferhub^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbufferhub^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_static/addition_copy_files.output

echo "building libbufferhub^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbufferhub,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbufferhub^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libbufferhub^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_static/addition_copy_files.output

echo "building libETC1^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libETC1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libETC1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libETC1^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_64_shared/addition_copy_files.output

echo "building libETC1^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libETC1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libETC1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libETC1^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared/addition_copy_files.output

echo "building libtimestats^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtimestats,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libtimestats^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/native/libtimestats^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.zst" ]; then
  echo "Compressing packages/modules/Gki -> packages_modules_Gki.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Gki/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libvintf.tar.zst" ]; then
  echo "Compressing system/libvintf -> system_libvintf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libvintf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libvintf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
