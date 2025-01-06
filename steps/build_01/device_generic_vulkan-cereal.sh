
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

echo "Preparing for device/generic/vulkan-cereal"

clone_depth_platform art
clone_depth_platform bionic
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth device/generic/vulkan-cereal
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building gfxstream_base^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_base^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_base^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_base,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_base^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_base^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/base/gfxstream_base^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_host_common^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_host_common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_host_common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_host_common^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_host_common^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_host_common,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_host_common^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_host_common^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/host-common/gfxstream_host_common^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_dispatch^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_dispatch,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_dispatch^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_dispatch^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_dispatch^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_dispatch,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_dispatch^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_dispatch^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_apigen_codec_common^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_apigen_codec_common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_apigen_codec_common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_apigen_codec_common^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_apigen_codec_common^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_apigen_codec_common,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_apigen_codec_common^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_apigen_codec_common^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_compressedTextures^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_compressedTextures,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_compressedTextures^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_compressedTextures^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_compressedTextures^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_compressedTextures,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_compressedTextures^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_compressedTextures^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_gles1_dec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_gles1_dec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles1_dec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles1_dec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_gles1_dec^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_gles1_dec,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles1_dec^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles1_dec^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_gles2_dec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_gles2_dec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles2_dec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles2_dec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_gles2_dec^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_gles2_dec,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles2_dec^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_gles2_dec^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_translator_egl^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_egl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_egl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_egl^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_translator_egl^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_egl,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_egl^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_egl^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_translator_glescm^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glescm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glescm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glescm^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_translator_glescm^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glescm,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glescm^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glescm^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_translator_glesv2^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glesv2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glesv2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glesv2^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_translator_glesv2^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glesv2,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glesv2^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glesv2^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_translator_glcommon^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glcommon,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glcommon^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glcommon^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_translator_glcommon^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_translator_glcommon,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glcommon^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_translator_glcommon^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_glsnapshot^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_glsnapshot,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_glsnapshot^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_glsnapshot^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_glsnapshot^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_glsnapshot,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_glsnapshot^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_glsnapshot^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_renderControl_dec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_renderControl_dec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_renderControl_dec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_renderControl_dec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_renderControl_dec^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_renderControl_dec,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_renderControl_dec^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_renderControl_dec^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_vulkan_server^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_vulkan_server,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_server^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_server^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_vulkan_server^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_vulkan_server,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_server^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_server^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_vulkan_cereal_host^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_vulkan_cereal_host,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_cereal_host^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_cereal_host^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_vulkan_cereal_host,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_angle_stub^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_angle_stub,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_angle_stub^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_angle_stub^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_angle_stub^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_angle_stub,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_angle_stub^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_angle_stub^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_astc_codec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_astc_codec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_astc_codec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_astc_codec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_astc_codec^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_astc_codec,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_astc_codec^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_astc_codec^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec^android_x86_64_static_apex10000/addition_copy_files.output

echo "building gfxstream_lz4^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_lz4,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_lz4^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_lz4^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static/addition_copy_files.output

echo "building gfxstream_lz4^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gfxstream_lz4,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_lz4^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/gfxstream_lz4^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4^android_x86_64_static_apex10000/addition_copy_files.output

echo "building perfetto-tracing-only^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-tracing-only,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-tracing-only^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-tracing-only^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static/addition_copy_files.output

echo "building perfetto-tracing-only^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-tracing-only,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-tracing-only^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-tracing-only^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only^android_x86_64_static_apex10000/addition_copy_files.output

echo "building perfetto-libperfettobase^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-libperfettobase,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libperfettobase^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libperfettobase^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static/addition_copy_files.output

echo "building perfetto-libperfettobase^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-libperfettobase,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libperfettobase^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libperfettobase^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase^android_x86_64_static_apex10000/addition_copy_files.output

echo "building perfetto-libprotozero^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-libprotozero,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libprotozero^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libprotozero^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static/addition_copy_files.output

echo "building perfetto-libprotozero^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja perfetto-libprotozero,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libprotozero^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/generic/vulkan-cereal/perfetto-libprotozero^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero^android_x86_64_static_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_generic_vulkan-cereal.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 device_generic_vulkan-cereal.tar.zst --clobber

du -ah -d1 device_generic_vulkan-cereal*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_generic_vulkan-cereal.tar.zst" ]; then
  echo "Compressing device/generic/vulkan-cereal -> device_generic_vulkan-cereal.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_generic_vulkan-cereal.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/generic/vulkan-cereal/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
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


rm -rf aosp
