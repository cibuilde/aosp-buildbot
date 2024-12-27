set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/compile/mclinker
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-intrinsics^/ .

echo "building libmcldAArch64Info^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldAArch64Info,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldAArch64Info^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info^android_x86_64_static

echo "building libmcldAArch64Target^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldAArch64Target,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldAArch64Target^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target^android_x86_64_static

echo "building libmcldADT^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldADT,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/ADT/libmcldADT^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldADT^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/ADT/libmcldADT^android_x86_64_static

echo "building libmcldARMInfo^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldARMInfo,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldARMInfo^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo^android_x86_64_static

echo "building libmcldARMTarget^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldARMTarget,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldARMTarget^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget^android_x86_64_static

echo "building libmcldCore^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldCore,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Core/libmcldCore^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldCore^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Core/libmcldCore^android_x86_64_static

echo "building libmcldFragment^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldFragment,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Fragment/libmcldFragment^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldFragment^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Fragment/libmcldFragment^android_x86_64_static

echo "building libmcldLDVariant^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldLDVariant,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/LD/libmcldLDVariant^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldLDVariant^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/LD/libmcldLDVariant^android_x86_64_static

echo "building libmcldLD^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldLD,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/LD/libmcldLD^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldLD^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/LD/libmcldLD^android_x86_64_static

echo "building libmcldMC^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldMC,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/MC/libmcldMC^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldMC^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/MC/libmcldMC^android_x86_64_static

echo "building libmcldObject^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldObject,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Object/libmcldObject^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldObject^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Object/libmcldObject^android_x86_64_static

echo "building libmcldScript^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldScript,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Script/libmcldScript^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldScript^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Script/libmcldScript^android_x86_64_static

echo "building libmcldSupport^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldSupport,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Support/libmcldSupport^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldSupport^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Support/libmcldSupport^android_x86_64_static

echo "building libmcldTarget^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldTarget,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/libmcldTarget^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldTarget^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/libmcldTarget^android_x86_64_static

echo "building libmcldX86Info^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldX86Info,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldX86Info^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info^android_x86_64_static

echo "building libmcldX86Target^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libmcldX86Target,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/compile/mclinker/libmcldX86Target^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_compile_mclinker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 frameworks_compile_mclinker.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_compile_mclinker.tar.zst" ]; then
  echo "Compressing frameworks/compile/mclinker -> frameworks_compile_mclinker.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_compile_mclinker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/compile/mclinker/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
