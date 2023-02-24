df -h



start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a \
out/soong/.intermediates/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier \


mkdir -p prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/update_verifier/include/ prebuiltlibs/bootable/recovery/update_verifier/include
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/ && rsync -ar out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/gen/proto prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/update_verifier/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier prebuiltlibs/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier

printf "cc_prebuilt_library_static {\n  name: \"libupdate_verifier\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libotautil\",\"libvold_binder\"],\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libcutils\",\"libbinder\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libupdate_verifier.a\"],\n}\ncc_prebuilt_binary {\n  name: \"update_verifier\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libcutils\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libbinder\",\"libutils\"],\n  init_rc: [\"update_verifier.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_verifier\"],\n}\n" >> prebuiltlibs/bootable/recovery/update_verifier/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-11
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-11.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static/gfxstream_angle_stub.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static_apex10000/gfxstream_angle_stub.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static/gfxstream_astc_codec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static_apex10000/gfxstream_astc_codec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static/gfxstream_compressedTextures.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static_apex10000/gfxstream_compressedTextures.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static/gfxstream_glsnapshot.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static_apex10000/gfxstream_glsnapshot.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static/gfxstream_lz4.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static_apex10000/gfxstream_lz4.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static/perfetto-libperfettobase.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static_apex10000/perfetto-libperfettobase.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static/perfetto-libprotozero.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static_apex10000/perfetto-libprotozero.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static/perfetto-tracing-only.a \
out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static_apex10000/perfetto-tracing-only.a \
out/soong/.intermediates/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static/gfxstream_base.a \
out/soong/.intermediates/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static_apex10000/gfxstream_base.a \
out/soong/.intermediates/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static/gfxstream_host_common.a \
out/soong/.intermediates/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static_apex10000/gfxstream_host_common.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static/gfxstream_apigen_codec_common.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static_apex10000/gfxstream_apigen_codec_common.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static/gfxstream_gles1_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static_apex10000/gfxstream_gles1_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static/gfxstream_gles2_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static_apex10000/gfxstream_gles2_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static/gfxstream_renderControl_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static_apex10000/gfxstream_renderControl_dec.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static/gfxstream_translator_glcommon.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static_apex10000/gfxstream_translator_glcommon.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static/gfxstream_translator_glescm.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static_apex10000/gfxstream_translator_glescm.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static/gfxstream_translator_glesv2.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static_apex10000/gfxstream_translator_glesv2.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static/gfxstream_translator_egl.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static_apex10000/gfxstream_translator_egl.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static/gfxstream_dispatch.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static_apex10000/gfxstream_dispatch.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static/gfxstream_vulkan_cereal_host.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static_apex10000/gfxstream_vulkan_cereal_host.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static/gfxstream_vulkan_server.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static_apex10000/gfxstream_vulkan_server.a \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared/libgfxstream_backend.so \
out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared_apex10000/libgfxstream_backend.so \


mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static/gfxstream_angle_stub.a prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static/gfxstream_angle_stub.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static_apex10000/gfxstream_angle_stub.a prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/gfxstream_angle_stub/android_x86_64_static_apex10000/gfxstream_angle_stub.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/src/libShaderTranslator
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/third-party/angle/src/libShaderTranslator/ prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/src/libShaderTranslator
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static/gfxstream_astc_codec.a prebuiltlibs/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static/gfxstream_astc_codec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static_apex10000/gfxstream_astc_codec.a prebuiltlibs/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/gfxstream_astc_codec/android_x86_64_static_apex10000/gfxstream_astc_codec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static/gfxstream_compressedTextures.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static/gfxstream_compressedTextures.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static_apex10000/gfxstream_compressedTextures.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/gfxstream_compressedTextures/android_x86_64_static_apex10000/gfxstream_compressedTextures.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static/gfxstream_glsnapshot.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static/gfxstream_glsnapshot.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static_apex10000/gfxstream_glsnapshot.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/gfxstream_glsnapshot/android_x86_64_static_apex10000/gfxstream_glsnapshot.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/stream-servers/libGLSnapshot/ prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static/gfxstream_lz4.a prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static/gfxstream_lz4.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static_apex10000/gfxstream_lz4.a prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/gfxstream_lz4/android_x86_64_static_apex10000/gfxstream_lz4.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/third-party/lz4/ prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static/perfetto-libperfettobase.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static/perfetto-libperfettobase.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static_apex10000/perfetto-libperfettobase.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libperfettobase/android_x86_64_static_apex10000/perfetto-libperfettobase.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/third-party/perfetto/include/ prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/include
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static/perfetto-libprotozero.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static/perfetto-libprotozero.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static_apex10000/perfetto-libprotozero.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/perfetto-libprotozero/android_x86_64_static_apex10000/perfetto-libprotozero.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/third-party/perfetto/include/ prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/include
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static/perfetto-tracing-only.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static/perfetto-tracing-only.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static_apex10000/perfetto-tracing-only.a prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/perfetto-tracing-only/android_x86_64_static_apex10000/perfetto-tracing-only.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/third-party/perfetto-tracing-only/ prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static/gfxstream_base.a prebuiltlibs/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static/gfxstream_base.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static_apex10000/gfxstream_base.a prebuiltlibs/device/generic/vulkan-cereal/base/gfxstream_base/android_x86_64_static_apex10000/gfxstream_base.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static/gfxstream_host_common.a prebuiltlibs/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static/gfxstream_host_common.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static_apex10000/gfxstream_host_common.a prebuiltlibs/device/generic/vulkan-cereal/host-common/gfxstream_host_common/android_x86_64_static_apex10000/gfxstream_host_common.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static/gfxstream_apigen_codec_common.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static/gfxstream_apigen_codec_common.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static_apex10000/gfxstream_apigen_codec_common.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/gfxstream_apigen_codec_common/android_x86_64_static_apex10000/gfxstream_apigen_codec_common.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/stream-servers/apigen-codec-common/ prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static/gfxstream_gles1_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static/gfxstream_gles1_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static_apex10000/gfxstream_gles1_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles1_dec/gfxstream_gles1_dec/android_x86_64_static_apex10000/gfxstream_gles1_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static/gfxstream_gles2_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static/gfxstream_gles2_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static_apex10000/gfxstream_gles2_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles2_dec/gfxstream_gles2_dec/android_x86_64_static_apex10000/gfxstream_gles2_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static/gfxstream_renderControl_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static/gfxstream_renderControl_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static_apex10000/gfxstream_renderControl_dec.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/renderControl_dec/gfxstream_renderControl_dec/android_x86_64_static_apex10000/gfxstream_renderControl_dec.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static/gfxstream_translator_glcommon.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static/gfxstream_translator_glcommon.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static_apex10000/gfxstream_translator_glcommon.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/gfxstream_translator_glcommon/android_x86_64_static_apex10000/gfxstream_translator_glcommon.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static/gfxstream_translator_glescm.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static/gfxstream_translator_glescm.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static_apex10000/gfxstream_translator_glescm.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/gfxstream_translator_glescm/android_x86_64_static_apex10000/gfxstream_translator_glescm.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static/gfxstream_translator_glesv2.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static/gfxstream_translator_glesv2.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static_apex10000/gfxstream_translator_glesv2.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/gfxstream_translator_glesv2/android_x86_64_static_apex10000/gfxstream_translator_glesv2.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static/gfxstream_translator_egl.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static/gfxstream_translator_egl.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static_apex10000/gfxstream_translator_egl.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/gfxstream_translator_egl/android_x86_64_static_apex10000/gfxstream_translator_egl.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static/gfxstream_dispatch.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static/gfxstream_dispatch.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static_apex10000/gfxstream_dispatch.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/gfxstream_dispatch/android_x86_64_static_apex10000/gfxstream_dispatch.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static/gfxstream_vulkan_cereal_host.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static/gfxstream_vulkan_cereal_host.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static_apex10000/gfxstream_vulkan_cereal_host.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/gfxstream_vulkan_cereal_host/android_x86_64_static_apex10000/gfxstream_vulkan_cereal_host.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/vulkan-cereal/stream-servers/vulkan/cereal/ prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static/gfxstream_vulkan_server.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static/gfxstream_vulkan_server.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static_apex10000/gfxstream_vulkan_server.a prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/gfxstream_vulkan_server/android_x86_64_static_apex10000/gfxstream_vulkan_server.a
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared/libgfxstream_backend.so prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared/libgfxstream_backend.so
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared_apex10000/libgfxstream_backend.so prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend/android_x86_64_shared_apex10000/libgfxstream_backend.so

printf "cc_prebuilt_library_static {\n  name: \"gfxstream_angle_stub\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\"src/libShaderTranslator\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_angle_stub.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/third-party/angle/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_astc_codec\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_astc_codec.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/third-party/astc-codec/src/decoder/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_compressedTextures\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_compressedTextures.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/compressedTextureFormats/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_glsnapshot\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_glsnapshot.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/libGLSnapshot/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_lz4\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_lz4.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/third-party/lz4/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"perfetto-libperfettobase\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\",\"include/perfetto/base/build_configs/android_tree\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto-libperfettobase.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"perfetto-libprotozero\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  whole_static_libs: [\"perfetto-libperfettobase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto-libprotozero.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"perfetto-tracing-only\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  whole_static_libs: [\"perfetto-libprotozero\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto-tracing-only.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/third-party/perfetto-tracing-only/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_base\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  whole_static_libs: [\"perfetto-tracing-only\"],\n  static_libs: [\"gfxstream_lz4\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_base.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/base/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_host_common\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_host_common.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/host-common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_apigen_codec_common\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_host_common\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_apigen_codec_common.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/apigen-codec-common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_gles1_dec\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_apigen_codec_common\",\"gfxstream_glsnapshot\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_gles1_dec.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles1_dec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_gles2_dec\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_apigen_codec_common\",\"gfxstream_glsnapshot\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_gles2_dec.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/gles2_dec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_renderControl_dec\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_apigen_codec_common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_renderControl_dec.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/renderControl_dec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_translator_glcommon\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_astc_codec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_translator_glcommon.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLcommon/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_translator_glescm\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_apigen_codec_common\",\"gfxstream_translator_glcommon\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_translator_glescm.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_CM/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_translator_glesv2\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_apigen_codec_common\",\"gfxstream_translator_glcommon\",\"gfxstream_angle_stub\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_translator_glesv2.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/GLES_V2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_translator_egl\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_astc_codec\",\"gfxstream_apigen_codec_common\",\"gfxstream_translator_glcommon\",\"gfxstream_translator_glescm\",\"gfxstream_translator_glesv2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_translator_egl.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/glestranslator/EGL/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_dispatch\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_gles1_dec\",\"gfxstream_gles2_dec\",\"gfxstream_apigen_codec_common\",\"gfxstream_translator_egl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_dispatch.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/OpenGLESDispatch/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_vulkan_cereal_host\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_vulkan_cereal_host.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/cereal/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"gfxstream_vulkan_server\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_compressedTextures\",\"gfxstream_apigen_codec_common\",\"gfxstream_vulkan_cereal_host\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gfxstream_vulkan_server.a\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/vulkan/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgfxstream_backend\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    android: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libnativewindow\"],\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  static_libs: [\"gfxstream_base\",\"gfxstream_host_common\",\"gfxstream_apigen_codec_common\",\"gfxstream_glsnapshot\",\"gfxstream_translator_glcommon\",\"gfxstream_translator_egl\",\"gfxstream_translator_glescm\",\"gfxstream_translator_glesv2\",\"gfxstream_vulkan_cereal_host\",\"gfxstream_vulkan_server\",\"gfxstream_renderControl_dec\",\"gfxstream_gles1_dec\",\"gfxstream_gles2_dec\",\"gfxstream_dispatch\",\"gfxstream_astc_codec\",\"gfxstream_angle_stub\",\"gfxstream_lz4\",\"gfxstream_compressedTextures\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgfxstream_backend.so\"],\n}\n" >> prebuiltlibs/device/generic/vulkan-cereal/stream-servers/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/generic/vulkan-cereal/ninja && rsync -ar out/soong/ninja/device/generic/vulkan-cereal/ prebuiltlibs/device/generic/vulkan-cereal/ninja/device_generic_vulkan-cereal-11
touch prebuiltlibs/device/generic/vulkan-cereal/ninja/.find-ignore
tar cfJ device_generic_vulkan-cereal-11.tar.xz -C prebuiltlibs/device/generic/vulkan-cereal/ .
ls -l device_generic_vulkan-cereal-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_64_shared/android.hardware.health@2.0-impl-2.1-cuttlefish.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_x86_64_shared/android.hardware.health@2.0-impl-2.1-cuttlefish.so \


mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_64_shared/android.hardware.health@2.0-impl-2.1-cuttlefish.so prebuiltlibs/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_64_shared/android.hardware.health@2.1-impl-cuttlefish.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_x86_64_shared/android.hardware.health@2.0-impl-2.1-cuttlefish.so prebuiltlibs/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish/android_vendor.31_x86_x86_64_shared/android.hardware.health@2.1-impl-cuttlefish.so

printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.health@2.1-impl-cuttlefish\",\n  stem: \"android.hardware.health@2.0-impl-2.1-cuttlefish\",\n  proprietary: true,\n  recovery_available: true,\n  relative_install_path: \"hw\",\n  static_libs: [\"android.hardware.health@1.0-convert\",\"libbatterymonitor\",\"libhealthloop\",\"libhealth2impl\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libhidlbase\",\"libutils\",\"android.hardware.health@2.0\",\"android.hardware.health@2.1\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health@2.1-impl-cuttlefish.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/health/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-11
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-11.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/angle/angle_common/android_x86_64_static/angle_common.a \
out/soong/.intermediates/external/angle/angle_common/android_x86_x86_64_static/angle_common.a \
out/soong/.intermediates/external/angle/angle_gpu_info_util/android_x86_64_static/angle_gpu_info_util.a \
out/soong/.intermediates/external/angle/angle_gpu_info_util/android_x86_x86_64_static/angle_gpu_info_util.a \
out/soong/.intermediates/external/angle/angle_image_util/android_x86_64_static/angle_image_util.a \
out/soong/.intermediates/external/angle/angle_image_util/android_x86_x86_64_static/angle_image_util.a \
out/soong/.intermediates/external/angle/angle_preprocessor/android_x86_64_static/angle_preprocessor.a \
out/soong/.intermediates/external/angle/angle_preprocessor/android_x86_x86_64_static/angle_preprocessor.a \
out/soong/.intermediates/external/angle/angle_translator/android_x86_64_static/angle_translator.a \
out/soong/.intermediates/external/angle/angle_translator/android_x86_x86_64_static/angle_translator.a \
out/soong/.intermediates/external/angle/libGLESv2_angle/android_x86_64_shared/libGLESv2_angle.so \
out/soong/.intermediates/external/angle/libGLESv2_angle/android_x86_x86_64_shared/libGLESv2_angle.so \
out/soong/.intermediates/external/angle/libEGL_angle/android_x86_64_shared/libEGL_angle.so \
out/soong/.intermediates/external/angle/libEGL_angle/android_x86_x86_64_shared/libEGL_angle.so \
out/soong/.intermediates/external/angle/libGLESv1_CM_angle/android_x86_64_shared/libGLESv1_CM_angle.so \
out/soong/.intermediates/external/angle/libGLESv1_CM_angle/android_x86_x86_64_shared/libGLESv1_CM_angle.so \


mkdir -p prebuiltlibs/external/angle/angle_common/android_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_common/android_x86_64_static/angle_common.a prebuiltlibs/external/angle/angle_common/android_x86_64_static/angle_common.a
mkdir -p prebuiltlibs/external/angle/angle_common/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_common/android_x86_x86_64_static/angle_common.a prebuiltlibs/external/angle/angle_common/android_x86_x86_64_static/angle_common.a
mkdir -p prebuiltlibs/external/angle/angle_gpu_info_util/android_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_gpu_info_util/android_x86_64_static/angle_gpu_info_util.a prebuiltlibs/external/angle/angle_gpu_info_util/android_x86_64_static/angle_gpu_info_util.a
mkdir -p prebuiltlibs/external/angle/angle_gpu_info_util/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_gpu_info_util/android_x86_x86_64_static/angle_gpu_info_util.a prebuiltlibs/external/angle/angle_gpu_info_util/android_x86_x86_64_static/angle_gpu_info_util.a
mkdir -p prebuiltlibs/external/angle/angle_image_util/android_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_image_util/android_x86_64_static/angle_image_util.a prebuiltlibs/external/angle/angle_image_util/android_x86_64_static/angle_image_util.a
mkdir -p prebuiltlibs/external/angle/angle_image_util/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_image_util/android_x86_x86_64_static/angle_image_util.a prebuiltlibs/external/angle/angle_image_util/android_x86_x86_64_static/angle_image_util.a
mkdir -p prebuiltlibs/external/angle/angle_preprocessor/android_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_preprocessor/android_x86_64_static/angle_preprocessor.a prebuiltlibs/external/angle/angle_preprocessor/android_x86_64_static/angle_preprocessor.a
mkdir -p prebuiltlibs/external/angle/angle_preprocessor/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_preprocessor/android_x86_x86_64_static/angle_preprocessor.a prebuiltlibs/external/angle/angle_preprocessor/android_x86_x86_64_static/angle_preprocessor.a
mkdir -p prebuiltlibs/external/angle/angle_translator/android_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_translator/android_x86_64_static/angle_translator.a prebuiltlibs/external/angle/angle_translator/android_x86_64_static/angle_translator.a
mkdir -p prebuiltlibs/external/angle/angle_translator/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/angle/angle_translator/android_x86_x86_64_static/angle_translator.a prebuiltlibs/external/angle/angle_translator/android_x86_x86_64_static/angle_translator.a
mkdir -p prebuiltlibs/external/angle/libGLESv2_angle/android_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libGLESv2_angle/android_x86_64_shared/libGLESv2_angle.so prebuiltlibs/external/angle/libGLESv2_angle/android_x86_64_shared/libGLESv2_angle.so
mkdir -p prebuiltlibs/external/angle/libGLESv2_angle/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libGLESv2_angle/android_x86_x86_64_shared/libGLESv2_angle.so prebuiltlibs/external/angle/libGLESv2_angle/android_x86_x86_64_shared/libGLESv2_angle.so
mkdir -p prebuiltlibs/external/angle/libEGL_angle/android_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libEGL_angle/android_x86_64_shared/libEGL_angle.so prebuiltlibs/external/angle/libEGL_angle/android_x86_64_shared/libEGL_angle.so
mkdir -p prebuiltlibs/external/angle/libEGL_angle/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libEGL_angle/android_x86_x86_64_shared/libEGL_angle.so prebuiltlibs/external/angle/libEGL_angle/android_x86_x86_64_shared/libEGL_angle.so
mkdir -p prebuiltlibs/external/angle/libGLESv1_CM_angle/android_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libGLESv1_CM_angle/android_x86_64_shared/libGLESv1_CM_angle.so prebuiltlibs/external/angle/libGLESv1_CM_angle/android_x86_64_shared/libGLESv1_CM_angle.so
mkdir -p prebuiltlibs/external/angle/libGLESv1_CM_angle/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/angle/libGLESv1_CM_angle/android_x86_x86_64_shared/libGLESv1_CM_angle.so prebuiltlibs/external/angle/libGLESv1_CM_angle/android_x86_x86_64_shared/libGLESv1_CM_angle.so

printf "cc_prebuilt_library_static {\n  name: \"angle_common\",\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  shared_libs: [\"liblog\",\"libnativewindow\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"angle_common.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"angle_gpu_info_util\",\n  stl: \"libc++_static\",\n  static_libs: [\"angle_common\"],\n  shared_libs: [\"liblog\",\"libnativewindow\"],\n  sdk_version: \"28\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"angle_gpu_info_util.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"angle_image_util\",\n  stl: \"libc++_static\",\n  static_libs: [\"angle_common\"],\n  shared_libs: [\"liblog\",\"libnativewindow\"],\n  sdk_version: \"28\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"angle_image_util.a\"],\n}\ncc_prebuilt_library_static {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"angle_preprocessor\",\n  static_libs: [\"angle_common\"],\n  shared_libs: [\"liblog\",\"libnativewindow\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"angle_preprocessor.a\"],\n}\ncc_prebuilt_library_static {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"angle_translator\",\n  static_libs: [\"angle_common\",\"angle_preprocessor\",\"third_party_vulkan_deps_spirv_tools_src_spvtools\",\"third_party_vulkan_deps_spirv_tools_src_spvtools_val\"],\n  shared_libs: [\"liblog\",\"libnativewindow\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"angle_translator.a\"],\n}\ncc_prebuilt_library_shared {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"libGLESv2_angle\",\n  static_libs: [\"chrome_zlib\",\"cpufeatures\",\"third_party_zlib_google_compression_utils_portable\",\"angle_common\",\"angle_gpu_info_util\",\"angle_image_util\",\"angle_preprocessor\",\"angle_translator\",\"third_party_vulkan_deps_spirv_tools_src_spvtools\",\"third_party_vulkan_deps_spirv_tools_src_spvtools_val\"],\n  shared_libs: [\"liblog\",\"libnativewindow\",\"libdl\",\"libm\"],\n  vendor: true,\n  target: {\n    android: {\n      relative_install_path: \"egl\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv2_angle.so\"],\n}\ncc_prebuilt_library_shared {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"libEGL_angle\",\n  vendor: true,\n  static_libs: [\"angle_common\",\"angle_gpu_info_util\",\"angle_image_util\",\"angle_preprocessor\",\"angle_translator\",\"chrome_zlib\",\"cpufeatures\",\"third_party_vulkan_deps_spirv_tools_src_spvtools\",\"third_party_vulkan_deps_spirv_tools_src_spvtools_val\",\"third_party_zlib_google_compression_utils_portable\"],\n  shared_libs: [\"libGLESv2_angle\",\"libdl\",\"liblog\",\"libm\",\"libnativewindow\"],\n  target: {\n    android: {\n      relative_install_path: \"egl\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_angle.so\"],\n}\ncc_prebuilt_library_shared {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"libGLESv1_CM_angle\",\n  vendor: true,\n  static_libs: [\"angle_common\",\"angle_gpu_info_util\",\"angle_image_util\",\"angle_preprocessor\",\"angle_translator\",\"chrome_zlib\",\"cpufeatures\",\"third_party_vulkan_deps_spirv_tools_src_spvtools\",\"third_party_vulkan_deps_spirv_tools_src_spvtools_val\",\"third_party_zlib_google_compression_utils_portable\"],\n  shared_libs: [\"libGLESv2_angle\",\"libdl\",\"libm\"],\n  target: {\n    android: {\n      relative_install_path: \"egl\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv1_CM_angle.so\"],\n}\n" >> prebuiltlibs/external/angle/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/angle/ninja && rsync -ar out/soong/ninja/external/angle/ prebuiltlibs/external/angle/ninja/external_angle-11
touch prebuiltlibs/external/angle/ninja/.find-ignore
tar cfJ external_angle-11.tar.xz -C prebuiltlibs/external/angle/ .
ls -l external_angle-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_64_shared/hwcomposer.drm.so \
out/soong/.intermediates/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_x86_64_shared/hwcomposer.drm.so \


mkdir -p prebuiltlibs/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_64_shared/hwcomposer.drm.so prebuiltlibs/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_64_shared/hwcomposer.drm.so
mkdir -p prebuiltlibs/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_x86_64_shared/hwcomposer.drm.so prebuiltlibs/external/drm_hwcomposer/hwcomposer.drm/android_vendor.31_x86_x86_64_shared/hwcomposer.drm.so

printf "cc_prebuilt_library_shared {\n  name: \"hwcomposer.drm\",\n  shared_libs: [\"libcutils\",\"libdrm\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libsync\",\"libui\",\"libutils\"],\n  static_libs: [\"libdrmhwc_utils\"],\n  relative_install_path: \"hw\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hwcomposer.drm.so\"],\n}\n" >> prebuiltlibs/external/drm_hwcomposer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/drm_hwcomposer/ninja && rsync -ar out/soong/ninja/external/drm_hwcomposer/ prebuiltlibs/external/drm_hwcomposer/ninja/external_drm_hwcomposer-11
touch prebuiltlibs/external/drm_hwcomposer/ninja/.find-ignore
tar cfJ external_drm_hwcomposer-11.tar.xz -C prebuiltlibs/external/drm_hwcomposer/ .
ls -l external_drm_hwcomposer-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_64_static/libminigbm_cros_gralloc.a \
out/soong/.intermediates/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_x86_64_static/libminigbm_cros_gralloc.a \
out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm/android_vendor.31_x86_64/android.hardware.graphics.allocator@4.0-service.minigbm \
out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so \
out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so \


mkdir -p prebuiltlibs/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_64_static/libminigbm_cros_gralloc.a prebuiltlibs/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_64_static/libminigbm_cros_gralloc.a
mkdir -p prebuiltlibs/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_x86_64_static/libminigbm_cros_gralloc.a prebuiltlibs/external/minigbm/libminigbm_cros_gralloc/android_vendor.31_x86_x86_64_static/libminigbm_cros_gralloc.a
mkdir -p prebuiltlibs/external/minigbm/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/minigbm/ prebuiltlibs/external/minigbm/
mkdir -p prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm/android_vendor.31_x86_64/ && mv out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm/android_vendor.31_x86_64/android.hardware.graphics.allocator@4.0-service.minigbm prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm/android_vendor.31_x86_64/android.hardware.graphics.allocator@4.0-service.minigbm
mkdir -p prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so
mkdir -p prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm/android_vendor.31_x86_x86_64_shared/android.hardware.graphics.mapper@4.0-impl.minigbm.so

printf "cc_prebuilt_library_static {\n  name: \"libminigbm_cros_gralloc\",\n  header_libs: [\"libhardware_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libsystem_headers\"],\n  export_header_lib_headers: [\"libhardware_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libsystem_headers\"],\n  static_libs: [\"libarect\",\"libdrm\"],\n  export_static_lib_headers: [\"libarect\"],\n  vendor: true,\n  shared_libs: [\"libcutils\",\"libdrm\",\"libnativewindow\",\"libsync\",\"liblog\"],\n  relative_install_path: \"hw\",\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminigbm_cros_gralloc.a\"],\n}\n" >> prebuiltlibs/external/minigbm/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.graphics.allocator@4.0-service.minigbm\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  vintf_fragments: [\"android.hardware.graphics.allocator@4.0.xml\"],\n  shared_libs: [\"android.hardware.graphics.allocator@4.0\",\"android.hardware.graphics.mapper@4.0\",\"libbase\",\"libcutils\",\"libgralloctypes\",\"libhidlbase\",\"liblog\",\"libsync\",\"libutils\"],\n  init_rc: [\"android.hardware.graphics.allocator@4.0-service.minigbm.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.graphics.allocator@4.0-service.minigbm\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.graphics.mapper@4.0-impl.minigbm\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  vintf_fragments: [\"android.hardware.graphics.mapper@4.0.xml\"],\n  shared_libs: [\"android.hardware.graphics.mapper@4.0\",\"libbase\",\"libcutils\",\"libgralloctypes\",\"libhidlbase\",\"liblog\",\"libsync\",\"libutils\"],\n  static_libs: [\"libdrm\",\"libminigbm_cros_gralloc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.graphics.mapper@4.0-impl.minigbm.so\"],\n}\n" >> prebuiltlibs/external/minigbm/cros_gralloc/gralloc4/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/minigbm/ninja && rsync -ar out/soong/ninja/external/minigbm/ prebuiltlibs/external/minigbm/ninja/external_minigbm-11
touch prebuiltlibs/external/minigbm/ninja/.find-ignore
tar cfJ external_minigbm-11.tar.xz -C prebuiltlibs/external/minigbm/ .
ls -l external_minigbm-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/skia/libskia_renderengine/android_x86_64_static_lto-thin/libskia_renderengine.a \


mkdir -p prebuiltlibs/external/skia/libskia_renderengine/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/skia/libskia_renderengine/android_x86_64_static_lto-thin/libskia_renderengine.a prebuiltlibs/external/skia/libskia_renderengine/android_x86_64_static_lto-thin/libskia_renderengine.a
mkdir -p prebuiltlibs/external/skia/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/skia/ prebuiltlibs/external/skia/

printf "cc_prebuilt_library_static {\n  name: \"libskia_renderengine\",\n  export_include_dirs: [\"\",\"client_utils/android/\",\"include/android/\",\"include/c/\",\"include/codec/\",\"include/config/\",\"include/core/\",\"include/docs/\",\"include/effects/\",\"include/encode/\",\"include/gpu/\",\"include/pathops/\",\"include/ports/\",\"include/svg/\",\"include/utils/\",\"include/utils/mac/\",\"modules/particles/include/\",\"modules/skottie/include/\",\"modules/skparagraph/include/\",\"modules/skshaper/include/\",\"modules/svg/include/\",\"renderengine\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  target: {\n    android: {\n      shared_libs: [\"libEGL\",\"libGLESv2\",\"libvulkan\",\"libnativewindow\"],\n      export_shared_lib_headers: [\"libvulkan\"],\n    },\n  },\n  shared_libs: [\"libcutils\",\"liblog\",\"libpng\",\"libz\"],\n  static_libs: [\"libarect\"],\n  group_static_libs: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libskia_renderengine.a\"],\n}\n" >> prebuiltlibs/external/skia/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/skia/ninja && rsync -ar out/soong/ninja/external/skia/ prebuiltlibs/external/skia/ninja/external_skia-11
touch prebuiltlibs/external/skia/ninja/.find-ignore
tar cfJ external_skia-11.tar.xz -C prebuiltlibs/external/skia/ .
ls -l external_skia-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_64_static/libswiftshader_compiler.a \
out/soong/.intermediates/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_x86_64_static/libswiftshader_compiler.a \
out/soong/.intermediates/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_64_static/libswiftshader_llvm.a \
out/soong/.intermediates/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_x86_64_static/libswiftshader_llvm.a \
out/soong/.intermediates/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_64_shared/libEGL_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_x86_64_shared/libEGL_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_64_shared/libGLESv1_CM_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv1_CM_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_64_shared/libGLESv2_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv2_swiftshader.so \
out/soong/.intermediates/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_64_shared/vulkan.pastel.so \
out/soong/.intermediates/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_x86_64_shared/vulkan.pastel.so \


mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_64_static/libswiftshader_compiler.a prebuiltlibs/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_64_static/libswiftshader_compiler.a
mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_x86_64_static/libswiftshader_compiler.a prebuiltlibs/external/swiftshader/src/libswiftshader_compiler/android_vendor.31_x86_x86_64_static/libswiftshader_compiler.a
mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_64_static/libswiftshader_llvm.a prebuiltlibs/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_64_static/libswiftshader_llvm.a
mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_x86_64_static/libswiftshader_llvm.a prebuiltlibs/external/swiftshader/src/libswiftshader_llvm/android_vendor.31_x86_x86_64_static/libswiftshader_llvm.a
mkdir -p prebuiltlibs/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_64_shared/libEGL_swiftshader.so prebuiltlibs/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_64_shared/libEGL_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_x86_64_shared/libEGL_swiftshader.so prebuiltlibs/external/swiftshader/src/libEGL_swiftshader/android_vendor.31_x86_x86_64_shared/libEGL_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_64_shared/libGLESv1_CM_swiftshader.so prebuiltlibs/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_64_shared/libGLESv1_CM_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv1_CM_swiftshader.so prebuiltlibs/external/swiftshader/src/libGLESv1_CM_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv1_CM_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_64_shared/libGLESv2_swiftshader.so prebuiltlibs/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_64_shared/libGLESv2_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv2_swiftshader.so prebuiltlibs/external/swiftshader/src/libGLESv2_swiftshader/android_vendor.31_x86_x86_64_shared/libGLESv2_swiftshader.so
mkdir -p prebuiltlibs/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_64_shared/vulkan.pastel.so prebuiltlibs/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_64_shared/vulkan.pastel.so
mkdir -p prebuiltlibs/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_x86_64_shared/vulkan.pastel.so prebuiltlibs/external/swiftshader/src/vulkan.pastel/android_vendor.31_x86_x86_64_shared/vulkan.pastel.so

printf "cc_prebuilt_library_static {\n  name: \"libswiftshader_compiler\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      header_libs: [\"swiftshader_host_headers\",\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"egl\",\n      header_libs: [\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libswiftshader_compiler.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libswiftshader_llvm\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      header_libs: [\"swiftshader_host_headers\",\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"egl\",\n      header_libs: [\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  static_libs: [\"libLLVM10_swiftshader\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libswiftshader_llvm.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libEGL_swiftshader\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      header_libs: [\"swiftshader_host_headers\",\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"egl\",\n      header_libs: [\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  version_script: \"OpenGL/libEGL/libEGL.lds\",\n  static_libs: [\"libswiftshader_llvm\",\"libLLVM10_swiftshader\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_swiftshader.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libGLESv1_CM_swiftshader\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      header_libs: [\"swiftshader_host_headers\",\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"egl\",\n      header_libs: [\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  version_script: \"OpenGL/libGLES_CM/libGLES_CM.lds\",\n  static_libs: [\"libswiftshader_llvm\",\"libLLVM10_swiftshader\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv1_CM_swiftshader.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libGLESv2_swiftshader\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      header_libs: [\"swiftshader_host_headers\",\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"egl\",\n      header_libs: [\"swiftshader_platform_headers\",\"libnativebase_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  version_script: \"OpenGL/libGLESv2/libGLESv2.lds\",\n  static_libs: [\"libswiftshader_llvm\",\"libLLVM10_swiftshader\",\"libswiftshader_compiler\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv2_swiftshader.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"vulkan.pastel\",\n  static_libs: [\"swiftshader_astc\",\"swiftshader_debug\",\"swiftshader_marl\",\"swiftshader_spirv-tools\",\"libswiftshadervk_llvm_debug\",\"libLLVM10_swiftshader\"],\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      relative_install_path: \"hw\",\n      header_libs: [\"swiftshader_platform_headers\",\"vulkan_headers\",\"hwvulkan_headers\"],\n      shared_libs: [\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libnativewindow\",\"libhardware\",\"libhidlbase\",\"libcutils\",\"libsync\",\"liblog\",\"libutils\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  vendor: true,\n  version_script: \"Vulkan/android_vk_swiftshader.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vulkan.pastel.so\"],\n}\n" >> prebuiltlibs/external/swiftshader/src/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/swiftshader/ninja && rsync -ar out/soong/ninja/external/swiftshader/ prebuiltlibs/external/swiftshader/ninja/external_swiftshader-11
touch prebuiltlibs/external/swiftshader/ninja/.find-ignore
tar cfJ external_swiftshader-11.tar.xz -C prebuiltlibs/external/swiftshader/ .
ls -l external_swiftshader-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/vm_tools/p9/libp9/android_x86_64_rlib_rlib-std_apex10000/libp9.rlib \


mkdir -p prebuiltlibs/external/vm_tools/p9/libp9/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/vm_tools/p9/libp9/android_x86_64_rlib_rlib-std_apex10000/libp9.rlib prebuiltlibs/external/vm_tools/p9/libp9/android_x86_64_rlib_rlib-std_apex10000/libp9.rlib

printf "rust_prebuilt_rlib {\n  name: \"libp9\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"p9\",\n  rustlibs: [\"liblibc\",\"liblibchromeos\"],\n  proc_macros: [\"libwire_format_derive\"],\n  multiple_variants: true,\n  srcs: [\"libp9.rlib\"],\n}\n" >> prebuiltlibs/external/vm_tools/p9/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/vm_tools/p9/ninja && rsync -ar out/soong/ninja/external/vm_tools/p9/ prebuiltlibs/external/vm_tools/p9/ninja/external_vm_tools_p9-11
touch prebuiltlibs/external/vm_tools/p9/ninja/.find-ignore
tar cfJ external_vm_tools_p9-11.tar.xz -C prebuiltlibs/external/vm_tools/p9/ .
ls -l external_vm_tools_p9-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_64_shared/libcamera_client.so \
out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/libcamera_client.so \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared/libcodec2_vndk.so \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static/libcodec2_vndk.a \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_shared/libcodec2_vndk.so \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_static/libcodec2_vndk.a \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared_com.android.media.swcodec/libcodec2_vndk.so \
out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static_com.android.media.swcodec/libcodec2_vndk.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_shared/libcodec2_hidl_client@1.0.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_static/libcodec2_hidl_client@1.0.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_shared/libcodec2_hidl_client@1.0.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_static/libcodec2_hidl_client@1.0.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_shared/libcodec2_hidl_client@1.1.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_static/libcodec2_hidl_client@1.1.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_shared/libcodec2_hidl_client@1.1.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_static/libcodec2_hidl_client@1.1.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_shared/libcodec2_hidl_client@1.2.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_static/libcodec2_hidl_client@1.2.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_shared/libcodec2_hidl_client@1.2.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_static/libcodec2_hidl_client@1.2.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_shared/libcodec2_client.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_static/libcodec2_client.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_shared/libcodec2_client.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_static/libcodec2_client.a \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi/libsfplugin_ccodec_utils.so \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi/libsfplugin_ccodec_utils.a \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_shared_cfi/libsfplugin_ccodec_utils.so \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_static_cfi/libsfplugin_ccodec_utils.a \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.so \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_common.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_common.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263enc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263enc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg2dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg2dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4enc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4enc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.so \
out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/libmedia_omx.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/libmedia_omx.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/libmedia_omx.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/libmedia_omx.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/libmedia.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/libmedia.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/libmedia.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/libmedia.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_64_static/libaudiopolicycomponents.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_x86_64_static/libaudiopolicycomponents.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_64_static/libaudiopolicyengine_common.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_x86_64_static/libaudiopolicyengine_common.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_64_shared/libaudiopolicyengineconfigurable.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_x86_64_shared/libaudiopolicyengineconfigurable.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault/android_x86_64_shared/libaudiopolicyenginedefault.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault/android_x86_64_shared/libaudiopolicymanagerdefault.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/service/libaudiopolicyservice/android_x86_64_shared/libaudiopolicyservice.so \
out/soong/.intermediates/frameworks/av/media/audioserver/audioserver/android_x86_64/audioserver \
out/soong/.intermediates/frameworks/av/media/libheif/libheif/android_x86_64_shared/libheif.so \
out/soong/.intermediates/frameworks/av/media/libheif/libheif/android_x86_x86_64_shared/libheif.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_64_shared_cfi/libmedia_omx_client.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_x86_64_shared_cfi/libmedia_omx_client.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_shared/libmediadrm.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_static/libmediadrm.a \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_shared/libmediadrm.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_static/libmediadrm.a \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_64_shared/libmediadrmmetrics_consumer.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_x86_64_shared/libmediadrmmetrics_consumer.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_64_shared/libpolicy-subsystem.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_x86_64_shared/libpolicy-subsystem.so \
out/soong/.intermediates/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_shared/libresourcemanagerservice.so \
out/soong/.intermediates/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_static/libresourcemanagerservice.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_64_shared_cfi/libstagefright_codecbase.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_x86_64_shared_cfi/libstagefright_codecbase.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_64_static_cfi/libstagefright_mediafilter.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_x86_64_static_cfi/libstagefright_mediafilter.a \
out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer/android_x86_x86_64_static_cfi/libstagefright_nuplayer.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_64_shared_cfi/libstagefright_omx_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_x86_64_shared_cfi/libstagefright_omx_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_64_shared/libstagefright_omx_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_x86_64_shared/libstagefright_omx_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp/android_x86_x86_64_static_cfi/libstagefright_rtsp.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_64_static_cfi/libstagefright_timedtext.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_x86_64_static_cfi/libstagefright_timedtext.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_64_shared_cfi/libstagefright_xmlparser.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_x86_64_shared_cfi/libstagefright_xmlparser.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_64_shared/libstagefright_xmlparser.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_x86_64_shared/libstagefright_xmlparser.so \
out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so \
out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a \
out/soong/.intermediates/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics \
out/soong/.intermediates/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_64_static/librenderfright.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_x86_64_static/librenderfright.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_64_shared/libstagefright_framecapture_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_x86_64_shared/libstagefright_framecapture_utils.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_64_shared/libstagefright_bufferqueue_helper.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_x86_64_shared/libstagefright_bufferqueue_helper.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_64_shared_cfi/libstagefright_omx.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_x86_64_shared_cfi/libstagefright_omx.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_64_shared/libstagefright_omx.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_x86_64_shared/libstagefright_omx.so \
out/soong/.intermediates/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service/android_vendor.31_x86_x86_64/android.hardware.media.omx@1.0-service \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_64_shared_cfi/libsfplugin_ccodec.so \
out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_x86_64_shared_cfi/libsfplugin_ccodec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk/android_x86_64_shared_cfi_com.android.media.swcodec/libstagefright_bufferqueue_helper_novndk.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.0.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.0.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.1.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.1.a \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.2.so \
out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.2.a \
out/soong/.intermediates/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant/android_x86_64_shared_com.android.media.swcodec/libmedia_codecserviceregistrant.so \
out/soong/.intermediates/frameworks/av/services/mediacodec/mediaswcodec/android_x86_64_com.android.media.swcodec/mediaswcodec \
out/soong/.intermediates/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_64_static_cfi/libstagefright_color_conversion.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_x86_64_static_cfi/libstagefright_color_conversion.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_softomx/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrnbenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrwbenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_g711dec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_gsmdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_hevcdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mp3dec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg2dec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4dec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4enc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_opusdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_rawdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vorbisdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxenc.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx_plugin.so \


mkdir -p prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_64_shared/libcamera_client.so prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_64_shared/libcamera_client.so
mkdir -p prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/libcamera_client.so prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/libcamera_client.so
mkdir -p prebuiltlibs/frameworks/av/camera/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/camera/include/ prebuiltlibs/frameworks/av/camera/include
mkdir -p prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/av/camera/libcamera_client/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared/libcodec2_vndk.so prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared/libcodec2_vndk.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static/libcodec2_vndk.a prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static/libcodec2_vndk.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_shared/libcodec2_vndk.so prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_shared/libcodec2_vndk.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_static/libcodec2_vndk.a prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_x86_64_static/libcodec2_vndk.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared_com.android.media.swcodec/libcodec2_vndk.so prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_shared_com.android.media.swcodec/libcodec2_vndk.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static_com.android.media.swcodec/libcodec2_vndk.a prebuiltlibs/frameworks/av/media/codec2/vndk/libcodec2_vndk/android_x86_64_static_com.android.media.swcodec/libcodec2_vndk.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/vndk/include/ prebuiltlibs/frameworks/av/media/codec2/vndk/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_shared/libcodec2_hidl_client@1.0.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_shared/libcodec2_hidl_client@1.0.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_static/libcodec2_hidl_client@1.0.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_64_static/libcodec2_hidl_client@1.0.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_shared/libcodec2_hidl_client@1.0.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_shared/libcodec2_hidl_client@1.0.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_static/libcodec2_hidl_client@1.0.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0/android_x86_x86_64_static/libcodec2_hidl_client@1.0.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.0/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_shared/libcodec2_hidl_client@1.1.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_shared/libcodec2_hidl_client@1.1.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_static/libcodec2_hidl_client@1.1.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_64_static/libcodec2_hidl_client@1.1.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_shared/libcodec2_hidl_client@1.1.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_shared/libcodec2_hidl_client@1.1.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_static/libcodec2_hidl_client@1.1.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1/android_x86_x86_64_static/libcodec2_hidl_client@1.1.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.1/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_shared/libcodec2_hidl_client@1.2.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_shared/libcodec2_hidl_client@1.2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_static/libcodec2_hidl_client@1.2.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_64_static/libcodec2_hidl_client@1.2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_shared/libcodec2_hidl_client@1.2.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_shared/libcodec2_hidl_client@1.2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_static/libcodec2_hidl_client@1.2.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2/android_x86_x86_64_static/libcodec2_hidl_client@1.2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.2/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_shared/libcodec2_client.so prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_shared/libcodec2_client.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_static/libcodec2_client.a prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_64_static/libcodec2_client.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_shared/libcodec2_client.so prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_shared/libcodec2_client.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_static/libcodec2_client.a prebuiltlibs/frameworks/av/media/codec2/hidl/client/libcodec2_client/android_x86_x86_64_static/libcodec2_client.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/client/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/client/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/client/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi/libsfplugin_ccodec_utils.so prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi/libsfplugin_ccodec_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi/libsfplugin_ccodec_utils.a prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi/libsfplugin_ccodec_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_shared_cfi/libsfplugin_ccodec_utils.so prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_shared_cfi/libsfplugin_ccodec_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_static_cfi/libsfplugin_ccodec_utils.a prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_x86_64_static_cfi/libsfplugin_ccodec_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.so prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_shared_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.a prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils/android_x86_64_static_cfi_com.android.media.swcodec/libsfplugin_ccodec_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/sfplugin/utils/ prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_common.so prebuiltlibs/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_common.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_common.a prebuiltlibs/frameworks/av/media/codec2/components/base/libcodec2_soft_common/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_common.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/base/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/components/base/include/ prebuiltlibs/frameworks/av/media/codec2/components/base/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.so prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.a prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.so prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.a prebuiltlibs/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_aacenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.so prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.a prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.so prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.a prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrnbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.so prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.a prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.so prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.a prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_amrwbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.so prebuiltlibs/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.a prebuiltlibs/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_av1dec_gav1.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.so prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.a prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.so prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.a prebuiltlibs/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_avcenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.so prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.a prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.so prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.a prebuiltlibs/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_flacenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.so prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.a prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711alawdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.so prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.a prebuiltlibs/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_g711mlawdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.so prebuiltlibs/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.a prebuiltlibs/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_gsmdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263dec.so prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263dec.a prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263enc.so prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_h263enc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263enc.a prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_h263enc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.so prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.a prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.so prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.a prebuiltlibs/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_hevcenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.so prebuiltlibs/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.a prebuiltlibs/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_mp3dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg2dec.so prebuiltlibs/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg2dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg2dec.a prebuiltlibs/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg2dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4dec.so prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4dec.a prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4enc.so prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_shared_com.android.media.swcodec/libcodec2_soft_mpeg4enc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4enc.a prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc/android_x86_64_static_com.android.media.swcodec/libcodec2_soft_mpeg4enc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.so prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.a prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.so prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.a prebuiltlibs/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_opusenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.so prebuiltlibs/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.a prebuiltlibs/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_rawdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.so prebuiltlibs/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.a prebuiltlibs/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vorbisdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.so prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.a prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.so prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.a prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp8enc.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.so prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.a prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.so prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_shared_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.a prebuiltlibs/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc/android_x86_64_static_cfi_com.android.media.swcodec/libcodec2_soft_vp9enc.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/libmedia_omx.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/libmedia_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/libmedia_omx.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/libmedia_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/libmedia_omx.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/libmedia_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/libmedia_omx.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/libmedia_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/aidl
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/aidl/ prebuiltlibs/frameworks/av/media/libmedia/aidl
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_64_shared_cfi/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_x86_x86_64_shared_cfi/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/libmedia.so prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/libmedia.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/libmedia.a prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/libmedia.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/libmedia.so prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/libmedia.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/libmedia.a prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/libmedia.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_shared_cfi/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_64_static_cfi/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_shared_cfi/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/gen/aidl prebuiltlibs/frameworks/av/media/libmedia/libmedia/android_x86_x86_64_static_cfi/
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_64_static/libaudiopolicycomponents.a prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_64_static/libaudiopolicycomponents.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_x86_64_static/libaudiopolicycomponents.a prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents/android_x86_x86_64_static/libaudiopolicycomponents.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/common/managerdefinitions/include/ prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/include
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_64_static/libaudiopolicyengine_common.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_64_static/libaudiopolicyengine_common.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_x86_64_static/libaudiopolicyengine_common.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common/android_x86_x86_64_static/libaudiopolicyengine_common.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_64_shared/libaudiopolicyengineconfigurable.so prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_64_shared/libaudiopolicyengineconfigurable.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_x86_64_shared/libaudiopolicyengineconfigurable.so prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable/android_x86_x86_64_shared/libaudiopolicyengineconfigurable.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/engineconfigurable/include/ prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/include
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault/android_x86_64_shared/libaudiopolicyenginedefault.so prebuiltlibs/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault/android_x86_64_shared/libaudiopolicyenginedefault.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault/android_x86_64_shared/libaudiopolicymanagerdefault.so prebuiltlibs/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault/android_x86_64_shared/libaudiopolicymanagerdefault.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/managerdefault/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/managerdefault/ prebuiltlibs/frameworks/av/services/audiopolicy/managerdefault/
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/service/libaudiopolicyservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/service/libaudiopolicyservice/android_x86_64_shared/libaudiopolicyservice.so prebuiltlibs/frameworks/av/services/audiopolicy/service/libaudiopolicyservice/android_x86_64_shared/libaudiopolicyservice.so
mkdir -p prebuiltlibs/frameworks/av/media/audioserver/audioserver/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/media/audioserver/audioserver/android_x86_64/audioserver prebuiltlibs/frameworks/av/media/audioserver/audioserver/android_x86_64/audioserver
mkdir -p prebuiltlibs/frameworks/av/media/libheif/libheif/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libheif/libheif/android_x86_64_shared/libheif.so prebuiltlibs/frameworks/av/media/libheif/libheif/android_x86_64_shared/libheif.so
mkdir -p prebuiltlibs/frameworks/av/media/libheif/libheif/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libheif/libheif/android_x86_x86_64_shared/libheif.so prebuiltlibs/frameworks/av/media/libheif/libheif/android_x86_x86_64_shared/libheif.so
mkdir -p prebuiltlibs/frameworks/av/media/libheif/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libheif/include/ prebuiltlibs/frameworks/av/media/libheif/include
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_64_shared_cfi/libmedia_omx_client.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_64_shared_cfi/libmedia_omx_client.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_x86_64_shared_cfi/libmedia_omx_client.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_omx_client/android_x86_x86_64_shared_cfi/libmedia_omx_client.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_shared/libmediadrm.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_shared/libmediadrm.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_static/libmediadrm.a prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_64_static/libmediadrm.a
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_shared/libmediadrm.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_shared/libmediadrm.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_static/libmediadrm.a prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrm/android_x86_x86_64_static/libmediadrm.a
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libmediadrm/include/ prebuiltlibs/frameworks/av/drm/libmediadrm/include
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_64_shared/libmediadrmmetrics_consumer.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_64_shared/libmediadrmmetrics_consumer.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_x86_64_shared/libmediadrmmetrics_consumer.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer/android_x86_x86_64_shared/libmediadrmmetrics_consumer.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_64_shared/libpolicy-subsystem.so prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_64_shared/libpolicy-subsystem.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_x86_64_shared/libpolicy-subsystem.so prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem/android_x86_x86_64_shared/libpolicy-subsystem.so
mkdir -p prebuiltlibs/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_shared/libresourcemanagerservice.so prebuiltlibs/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_shared/libresourcemanagerservice.so
mkdir -p prebuiltlibs/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_static/libresourcemanagerservice.a prebuiltlibs/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice/android_x86_x86_64_static/libresourcemanagerservice.a
mkdir -p prebuiltlibs/frameworks/av/services/mediaresourcemanager/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/mediaresourcemanager/ prebuiltlibs/frameworks/av/services/mediaresourcemanager/
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_64_shared_cfi/libstagefright_codecbase.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_64_shared_cfi/libstagefright_codecbase.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_x86_64_shared_cfi/libstagefright_codecbase.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_codecbase/android_x86_x86_64_shared_cfi/libstagefright_codecbase.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_64_static_cfi/libstagefright_mediafilter.a prebuiltlibs/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_64_static_cfi/libstagefright_mediafilter.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_x86_64_static_cfi/libstagefright_mediafilter.a prebuiltlibs/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_x86_x86_64_static_cfi/libstagefright_mediafilter.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer/android_x86_x86_64_static_cfi/libstagefright_nuplayer.a prebuiltlibs/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer/android_x86_x86_64_static_cfi/libstagefright_nuplayer.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_64_shared_cfi/libstagefright_omx_utils.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_64_shared_cfi/libstagefright_omx_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_x86_64_shared_cfi/libstagefright_omx_utils.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_x86_x86_64_shared_cfi/libstagefright_omx_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_64_shared/libstagefright_omx_utils.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_64_shared/libstagefright_omx_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_x86_64_shared/libstagefright_omx_utils.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils/android_vendor.31_x86_x86_64_shared/libstagefright_omx_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/omx/include/ prebuiltlibs/frameworks/av/media/libstagefright/omx/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp/android_x86_x86_64_static_cfi/libstagefright_rtsp.a prebuiltlibs/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp/android_x86_x86_64_static_cfi/libstagefright_rtsp.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_64_static_cfi/libstagefright_timedtext.a prebuiltlibs/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_64_static_cfi/libstagefright_timedtext.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_x86_64_static_cfi/libstagefright_timedtext.a prebuiltlibs/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext/android_x86_x86_64_static_cfi/libstagefright_timedtext.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_64_shared_cfi/libstagefright_xmlparser.so prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_64_shared_cfi/libstagefright_xmlparser.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_x86_64_shared_cfi/libstagefright_xmlparser.so prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_x86_x86_64_shared_cfi/libstagefright_xmlparser.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_64_shared/libstagefright_xmlparser.so prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_64_shared/libstagefright_xmlparser.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_x86_64_shared/libstagefright_xmlparser.so prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser/android_vendor.31_x86_x86_64_shared/libstagefright_xmlparser.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/xmlparser/include/ prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/include
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/mediametrics/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics prebuiltlibs/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_64_static/librenderfright.a prebuiltlibs/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_64_static/librenderfright.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_x86_64_static/librenderfright.a prebuiltlibs/frameworks/av/media/libstagefright/renderfright/librenderfright/android_x86_x86_64_static/librenderfright.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/renderfright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/renderfright/include/ prebuiltlibs/frameworks/av/media/libstagefright/renderfright/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_64_shared/libstagefright_framecapture_utils.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_64_shared/libstagefright_framecapture_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_x86_64_shared/libstagefright_framecapture_utils.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_framecapture_utils/android_x86_x86_64_shared/libstagefright_framecapture_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_x86_x86_64_shared_cfi/libstagefright_bufferqueue_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_64_shared/libstagefright_bufferqueue_helper.so prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_64_shared/libstagefright_bufferqueue_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_x86_64_shared/libstagefright_bufferqueue_helper.so prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper/android_vendor.31_x86_x86_64_shared/libstagefright_bufferqueue_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/bqhelper/include/ prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_64_shared_cfi/libstagefright_omx.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_64_shared_cfi/libstagefright_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_x86_64_shared_cfi/libstagefright_omx.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_x86_x86_64_shared_cfi/libstagefright_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_64_shared/libstagefright_omx.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_64_shared/libstagefright_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_x86_64_shared/libstagefright_omx.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_omx/android_vendor.31_x86_x86_64_shared/libstagefright_omx.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/omx/include/ prebuiltlibs/frameworks/av/media/libstagefright/omx/include
mkdir -p prebuiltlibs/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service/android_vendor.31_x86_x86_64/android.hardware.media.omx@1.0-service prebuiltlibs/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service/android_vendor.31_x86_x86_64/android.hardware.media.omx@1.0-service
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_64_shared_cfi/libsfplugin_ccodec.so prebuiltlibs/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_64_shared_cfi/libsfplugin_ccodec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_x86_64_shared_cfi/libsfplugin_ccodec.so prebuiltlibs/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec/android_x86_x86_64_shared_cfi/libsfplugin_ccodec.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/sfplugin/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/sfplugin/include/ prebuiltlibs/frameworks/av/media/codec2/sfplugin/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk/android_x86_64_shared_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk/android_x86_64_shared_cfi_com.android.media.swcodec/libstagefright_bufferqueue_helper_novndk.so prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk/android_x86_64_shared_cfi_com.android.media.swcodec/libstagefright_bufferqueue_helper_novndk.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/bqhelper/include/ prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.0.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.0.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.0.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.0.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.0/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.1.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.1.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.1.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.1.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.1/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.2.so prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_shared_com.android.media.swcodec/libcodec2_hidl@1.2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.2.a prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2/android_x86_64_static_com.android.media.swcodec/libcodec2_hidl@1.2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/hidl/1.2/utils/include/ prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/include
mkdir -p prebuiltlibs/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant/android_x86_64_shared_com.android.media.swcodec/libmedia_codecserviceregistrant.so prebuiltlibs/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant/android_x86_64_shared_com.android.media.swcodec/libmedia_codecserviceregistrant.so
mkdir -p prebuiltlibs/frameworks/av/services/mediacodec/mediaswcodec/android_x86_64_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/av/services/mediacodec/mediaswcodec/android_x86_64_com.android.media.swcodec/mediaswcodec prebuiltlibs/frameworks/av/services/mediacodec/mediaswcodec/android_x86_64_com.android.media.swcodec/mediaswcodec
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_64_static_cfi/libstagefright_color_conversion.a prebuiltlibs/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_64_static_cfi/libstagefright_color_conversion.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_x86_64_static_cfi/libstagefright_color_conversion.a prebuiltlibs/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion/android_x86_x86_64_static_cfi/libstagefright_color_conversion.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_softomx/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_softomx/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_softomx/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/omx/include/ prebuiltlibs/frameworks/av/media/libstagefright/omx/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_aacenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrnbenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrnbenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrwbenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_amrwbenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_avcenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_flacenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_g711dec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_g711dec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_gsmdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_gsmdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_hevcdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_hevcdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mp3dec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mp3dec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg2dec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg2dec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4dec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4dec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4enc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_mpeg4enc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_opusdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_opusdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_rawdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_rawdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vorbisdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vorbisdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxdec.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxenc.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_soft_vpxenc.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin/android_vendor.31_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx_plugin.so prebuiltlibs/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_softomx_plugin.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/omx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/omx/include/ prebuiltlibs/frameworks/av/media/libstagefright/omx/include

printf "cc_prebuilt_library_shared {\n  name: \"libcamera_client\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libutils\",\"liblog\",\"libbinder\",\"libgui\",\"libcamera_metadata\",\"libnativewindow\"],\n  export_include_dirs: [\"include\",\"include/camera\"],\n  export_shared_lib_headers: [\"libcamera_metadata\",\"libnativewindow\",\"libgui\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcamera_client.so\"],\n}\n" >> prebuiltlibs/frameworks/av/camera/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_vndk\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbase\",\"android.hardware.media.bufferpool@2.0\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.2\",\"android.hardware.media.bufferpool@2.0\",\"libbase\",\"libcutils\",\"libdl\",\"libhardware\",\"libhidlbase\",\"libion\",\"libdmabufheap\",\"libfmq\",\"liblog\",\"libnativewindow\",\"libstagefright_foundation\",\"libstagefright_bufferpool@2.0.1\",\"libui\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_vndk.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_vndk.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/vndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_hidl_client@1.0\",\n  shared_libs: [\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"libbase\",\"libcodec2\",\"libcodec2_vndk\",\"libcutils\",\"libgui\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"libcodec2\",\"libgui\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl_client@1.0.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl_client@1.0.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_hidl@1.0\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.0\",\"android.hardware.media@1.0\",\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.omx@1.0\",\"libbase\",\"libcodec2\",\"libcodec2_vndk\",\"libcodec2_hidl_plugin_stub\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libstagefright_bufferqueue_helper_novndk\",\"libui\",\"libutils\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libstagefright_bufferqueue_helper_novndk\",\"libcodec2_hidl_plugin_stub\"],\n      shared_libs: [\"libstagefright_bufferqueue_helper\",\"libcodec2_hidl_plugin\"],\n    },\n    apex: {\n      exclude_shared_libs: [\"libcodec2_hidl_plugin\",\"libcodec2_hidl_plugin_stub\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"libcodec2\",\"libcodec2_vndk\",\"libhidlbase\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl@1.0.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl@1.0.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/hidl/1.0/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_hidl_client@1.1\",\n  shared_libs: [\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"libbase\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libcodec2_vndk\",\"libcutils\",\"libgui\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libgui\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl_client@1.1.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl_client@1.1.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_hidl@1.1\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.0\",\"android.hardware.media@1.0\",\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.omx@1.0\",\"libbase\",\"libcodec2\",\"libcodec2_hidl@1.0\",\"libcodec2_hidl_plugin_stub\",\"libcodec2_vndk\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libstagefright_bufferqueue_helper_novndk\",\"libui\",\"libutils\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libstagefright_bufferqueue_helper_novndk\",\"libcodec2_hidl_plugin_stub\"],\n      shared_libs: [\"libstagefright_bufferqueue_helper\",\"libcodec2_hidl_plugin\"],\n    },\n    apex: {\n      exclude_shared_libs: [\"libcodec2_hidl_plugin_stub\",\"libcodec2_hidl_plugin\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"libcodec2\",\"libcodec2_hidl@1.0\",\"libcodec2_vndk\",\"libhidlbase\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl@1.1.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl@1.1.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/hidl/1.1/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_hidl_client@1.2\",\n  shared_libs: [\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libbase\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libcodec2_hidl_client@1.1\",\"libcodec2_vndk\",\"libcutils\",\"libgui\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libcodec2_hidl_client@1.1\",\"libgui\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl_client@1.2.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl_client@1.2.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_hidl@1.2\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\",\"test_com.android.media.swcodec\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.0\",\"android.hardware.media@1.0\",\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"android.hardware.media.omx@1.0\",\"libbase\",\"libcodec2\",\"libcodec2_hidl@1.0\",\"libcodec2_hidl@1.1\",\"libcodec2_hidl_plugin_stub\",\"libcodec2_vndk\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libstagefright_bufferqueue_helper_novndk\",\"libui\",\"libutils\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libstagefright_bufferqueue_helper_novndk\",\"libcodec2_hidl_plugin_stub\"],\n      shared_libs: [\"libstagefright_bufferqueue_helper\",\"libcodec2_hidl_plugin\"],\n    },\n    apex: {\n      exclude_shared_libs: [\"libcodec2_hidl_plugin_stub\",\"libcodec2_hidl_plugin\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libcodec2\",\"libcodec2_hidl@1.0\",\"libcodec2_hidl@1.1\",\"libcodec2_vndk\",\"libhidlbase\",\"libstagefright_bufferpool@2.0.1\",\"libui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_hidl@1.2.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_hidl@1.2.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/hidl/1.2/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_client\",\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.media.bufferpool@2.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libbase\",\"libbinder\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libcodec2_hidl_client@1.1\",\"libcodec2_hidl_client@1.2\",\"libcodec2_vndk\",\"libcutils\",\"libgui\",\"libhidlbase\",\"liblog\",\"libstagefright_bufferpool@2.0.1\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libcodec2\",\"libcodec2_hidl_client@1.0\",\"libcodec2_hidl_client@1.1\",\"libcodec2_hidl_client@1.2\",\"libcodec2_vndk\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_client.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_client.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/hidl/client/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsfplugin_ccodec_utils\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  double_loadable: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"libcodec2\",\"libcodec2_vndk\",\"libcutils\",\"liblog\",\"libnativewindow\",\"libstagefright_foundation\",\"libutils\"],\n  static_libs: [\"libarect\",\"libyuv_static\"],\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsfplugin_ccodec_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libsfplugin_ccodec_utils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/sfplugin/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_common\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_common.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_common.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/base/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_aacdec\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  shared_libs: [\"libcodec2_soft_common\",\"libcutils\",\"liblog\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libFraunhoferAAC\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_aacdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_aacdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_aacenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libFraunhoferAAC\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_aacenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_aacenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/aac/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_amrnbdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libstagefright_amrnb_common\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libstagefright_amrnbdec\",\"libstagefright_amrwbdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_amrnbdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_amrnbdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_amrnbenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libstagefright_amrnb_common\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libstagefright_amrnbenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_amrnbenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_amrnbenc.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_amrwbdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libstagefright_amrnb_common\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libstagefright_amrnbdec\",\"libstagefright_amrwbdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_amrwbdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_amrwbdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_amrwbenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libstagefright_enc_common\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libstagefright_amrwbenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_amrwbenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_amrwbenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/amr_nb_wb/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_av1dec_gav1\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libgav1\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_av1dec_gav1.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_av1dec_gav1.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/gav1/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_avcdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  static_libs: [\"libavcdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_avcdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_avcdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_avcenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  static_libs: [\"libavcenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_avcenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_avcenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/avc/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_flacdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libstagefright_flacdec\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_flacdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_flacdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_flacenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libFLAC\",\"libaudioutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_flacenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_flacenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/flac/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_g711alawdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"codecs_g711dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_g711alawdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_g711alawdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_g711mlawdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"codecs_g711dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_g711mlawdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_g711mlawdec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/g711/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_gsmdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libgsm\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_gsmdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_gsmdec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/gsm/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_h263dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_m4vh263dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_h263dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_h263dec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_h263enc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_m4vh263enc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_h263enc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_h263enc.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_mpeg4dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_m4vh263dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_mpeg4dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_mpeg4dec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_mpeg4enc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_m4vh263enc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_mpeg4enc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_mpeg4enc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/mpeg4_h263/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_hevcdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  static_libs: [\"libhevcdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_hevcdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_hevcdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_hevcenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  static_libs: [\"libhevcenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_hevcenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_hevcenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/hevc/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_mp3dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libstagefright_mp3dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_mp3dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_mp3dec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/mp3/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_mpeg2dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libmpeg2dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_mpeg2dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_mpeg2dec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/mpeg2/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_opusdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libopus\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_opusdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_opusdec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_opusenc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libopus\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_opusenc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_opusenc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/opus/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_rawdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_rawdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_rawdec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/raw/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_vorbisdec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  static_libs: [\"libvorbisidec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_vorbisdec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_vorbisdec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/vorbis/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2_soft_vp8dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libvpx\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_vp8dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_vp8dec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_vp8enc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libvpx\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_vp8enc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_vp8enc.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_vp9dec\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libvpx\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_vp9dec.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_vp9dec.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libcodec2_soft_vp9enc\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcodec2_soft_common\",\"libcutils\",\"libsfplugin_ccodec_utils\",\"libstagefright_foundation\",\"libvpx\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  version_script: \":codec2_soft_exports\",\n  export_shared_lib_headers: [\"libsfplugin_ccodec_utils\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2_soft_vp9enc.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2_soft_vp9enc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/components/vpx/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_omx\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  shared_libs: [\"android.hidl.token@1.0-utils\",\"android.hardware.media.omx@1.0\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libstagefright_foundation\",\"libui\",\"libutils\"],\n  export_shared_lib_headers: [\"android.hidl.token@1.0-utils\",\"android.hardware.media.omx@1.0\",\"libstagefright_foundation\",\"libui\"],\n  header_libs: [\"libstagefright_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"media_plugin_headers\"],\n  export_include_dirs: [\"aidl\",\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_omx.so\"],\n}\ncc_prebuilt_library {\n  name: \"libmedia\",\n  header_libs: [\"libstagefright_headers\",\"media_ndk_headers\",\"jni_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"media_ndk_headers\",\"jni_headers\"],\n  shared_libs: [\"android.hidl.token@1.0-utils\",\"audioclient-types-aidl-cpp\",\"av-types-aidl-cpp\",\"liblog\",\"libcutils\",\"libprocessgroup\",\"libutils\",\"libbinder\",\"libbinder_ndk\",\"libandroidicu\",\"libexpat\",\"libcamera_client\",\"libstagefright_foundation\",\"libgui\",\"libdl\",\"libaudioclient\",\"libmedia_codeclist\",\"libmedia_omx\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"libaudioclient\",\"libbinder\",\"libandroidicu\",\"libmedia_omx\",\"framework-permission-aidl-cpp\"],\n  static_libs: [\"resourcemanager_aidl_interface-ndk_platform\",\"framework-permission-aidl-cpp\"],\n  export_static_lib_headers: [\"resourcemanager_aidl_interface-ndk_platform\",\"framework-permission-aidl-cpp\"],\n  export_include_dirs: [\"include\"],\n  version_script: \"exports.lds\",\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmedia.a\"],\n  },\n  shared: {\n    srcs: [\"libmedia.so\"],\n  },\n}\ncc_prebuilt_library_shared {\n  name: \"libmedia_omx_client\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"libgui\",\"libhidlbase\",\"liblog\",\"libmedia_omx\",\"libstagefright_foundation\",\"libui\",\"libutils\"],\n  export_shared_lib_headers: [\"libgui\",\"libmedia_omx\",\"libstagefright_foundation\",\"libui\"],\n  header_libs: [\"libstagefright_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"media_plugin_headers\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_omx_client.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaudiopolicycomponents\",\n  shared_libs: [\"libaudiofoundation\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libmedia\",\"libmedia_helper\",\"libutils\",\"libxml2\"],\n  export_shared_lib_headers: [\"libaudiofoundation\",\"libmedia\",\"libmedia_helper\"],\n  static_libs: [\"libaudioutils\"],\n  header_libs: [\"libaudiopolicycommon\"],\n  export_header_lib_headers: [\"libaudiopolicycommon\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicycomponents.a\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/common/managerdefinitions/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaudiopolicyengine_common\",\n  header_libs: [\"libaudiopolicyengine_common_headers\"],\n  export_header_lib_headers: [\"libaudiopolicyengine_common_headers\"],\n  static_libs: [\"libaudiopolicycomponents\",\"libaudiopolicyengine_config\"],\n  shared_libs: [\"libaudiofoundation\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyengine_common.a\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiopolicyengineconfigurable\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libaudiopolicycomponents\",\"libaudiopolicyengine_common\",\"libaudiopolicyengine_config\",\"libaudiopolicyengineconfigurable_pfwwrapper\"],\n  shared_libs: [\"libaudiofoundation\",\"liblog\",\"libcutils\",\"libutils\",\"libmedia_helper\",\"libaudiopolicy\",\"libparameter\",\"libxml2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyengineconfigurable.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiopolicyenginedefault\",\n  static_libs: [\"libaudiopolicycomponents\",\"libaudiopolicyengine_common\",\"libaudiopolicyengine_config\"],\n  shared_libs: [\"libaudiofoundation\",\"liblog\",\"libcutils\",\"libutils\",\"libmedia_helper\",\"libaudiopolicy\",\"libxml2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyenginedefault.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/enginedefault/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiopolicymanagerdefault\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libaudiofoundation\",\"libcutils\",\"libdl\",\"libutils\",\"liblog\",\"libaudiopolicy\",\"libmedia_helper\",\"libmediametrics\",\"libbinder\",\"libhidlbase\",\"libxml2\",\"libaudiopolicyenginedefault\",\"framework-permission-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  static_libs: [\"libaudiopolicycomponents\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicymanagerdefault.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/managerdefault/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiopolicyservice\",\n  shared_libs: [\"libactivitymanager_aidl\",\"libaudioclient\",\"libaudioclient_aidl_conversion\",\"libaudiofoundation\",\"libaudiopolicy\",\"libaudiopolicymanagerdefault\",\"libaudioutils\",\"libbinder\",\"libcutils\",\"libeffectsconfig\",\"libhardware_legacy\",\"liblog\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libpermission\",\"libsensorprivacy\",\"libutils\",\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"audiopolicy-types-aidl-cpp\",\"capture_state_listener-aidl-cpp\",\"framework-permission-aidl-cpp\"],\n  static_libs: [\"libaudiopolicycomponents\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"libactivitymanager_aidl\",\"libsensorprivacy\",\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyservice.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/service/Android.bp
printf "cc_prebuilt_binary {\n  name: \"audioserver\",\n  shared_libs: [\"libaaudioservice\",\"libaudioflinger\",\"libaudiopolicyservice\",\"libaudioprocessing\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libmedia\",\"libmedialogservice\",\"libmediautils\",\"libnbaio\",\"libnblog\",\"libpowermanager\",\"libutils\",\"libvibrator\"],\n  init_rc: [\"audioserver.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"audioserver\"],\n}\n" >> prebuiltlibs/frameworks/av/media/audioserver/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libheif\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\",\"libmedia\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libheif.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libheif/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediadrm\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder_ndk\",\"libcutils\",\"libdl\",\"liblog\",\"libmedia\",\"libmediadrmmetrics_lite\",\"libmediametrics#1\",\"libmediautils\",\"libstagefright_foundation\",\"libutils\",\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"android.hardware.drm@1.3\",\"android.hardware.drm@1.4\",\"libhidlallocatorutils\",\"libhidlbase\"],\n  static_libs: [\"resourcemanager_aidl_interface-ndk_platform\"],\n  export_shared_lib_headers: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"android.hardware.drm@1.4\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediadrm.a\"],\n  },\n  shared: {\n    srcs: [\"libmediadrm.so\"],\n  },\n}\ncc_prebuilt_library_shared {\n  name: \"libmediadrmmetrics_consumer\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libmediadrm\",\"libmediadrmmetrics_full\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediadrmmetrics_consumer.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libmediadrm/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpolicy-subsystem\",\n  static_libs: [\"libaudiopolicycomponents\",\"libaudiopolicyengine_common\",\"libpfw_utility\"],\n  shared_libs: [\"libaudiopolicyengineconfigurable\",\"liblog\",\"libutils\",\"libmedia_helper\",\"libparameter\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpolicy-subsystem.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/Android.bp
printf "cc_prebuilt_library {\n  name: \"libresourcemanagerservice\",\n  shared_libs: [\"libmedia\",\"libmediautils\",\"libbinder\",\"libbinder_ndk\",\"libutils\",\"liblog\"],\n  static_libs: [\"resourceobserver_aidl_interface-V1-ndk_platform\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libresourcemanagerservice.a\"],\n  },\n  shared: {\n    srcs: [\"libresourcemanagerservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/mediaresourcemanager/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_codecbase\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libgui\",\"libhidlallocatorutils\",\"liblog\",\"libmedia_codeclist\",\"libmedia_omx\",\"libstagefright_foundation\",\"libui\",\"libutils\",\"android.hardware.cas.native@1.0\",\"android.hardware.drm@1.0\"],\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_codecbase.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libstagefright_framecapture_utils\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libgui\",\"liblog\",\"libprocessgroup\",\"libstagefright_foundation\",\"libsync\",\"libui\",\"libutils\"],\n  static_libs: [\"librenderfright\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    cfi: false,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_framecapture_utils.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_mediafilter\",\n  shared_libs: [\"libgui\",\"libmedia\",\"libhidlmemory\"],\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mediafilter.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/filters/Android.bp
printf "cc_prebuilt_library_static {\n  shared_libs: [\"libbinder\",\"libdatasource\",\"libui\",\"libgui\",\"libmedia\",\"libmediadrm\",\"libpowermanager\"],\n  static_libs: [\"libplayerservice_datasource\"],\n  name: \"libstagefright_nuplayer\",\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_nuplayer.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediaplayerservice/nuplayer/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_omx_utils\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libmedia_omx\",\"libstagefright_foundation\",\"liblog\"],\n  export_shared_lib_headers: [\"libmedia_omx\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_omx_utils.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libstagefright_omx\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libmedia_omx\",\"libutils\",\"liblog\",\"libui\",\"libcutils\",\"libstagefright_foundation\",\"libstagefright_bufferqueue_helper\",\"libstagefright_xmlparser\",\"libdl\",\"libhidlbase\",\"libhidlmemory\",\"libvndksupport\",\"android.hardware.media.omx@1.0\",\"android.hardware.graphics.bufferqueue@1.0\"],\n  export_shared_lib_headers: [\"libstagefright_foundation\",\"libstagefright_xmlparser\",\"libutils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_omx.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libstagefright_softomx\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libstagefright_foundation\",\"liblog\",\"libui\",\"libutils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_softomx.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libstagefright_softomx_plugin\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"liblog\",\"libutils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_softomx_plugin.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/omx/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_rtsp\",\n  shared_libs: [\"libandroid_net\",\"libcrypto\",\"libdatasource\",\"libmedia\"],\n  arch: {\n    arm: {\n    },\n  },\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_rtsp.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/rtsp/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_timedtext\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libmedia\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_timedtext.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/timedtext/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_xmlparser\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libexpat\",\"liblog\",\"libstagefright_omx_utils\"],\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_xmlparser.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/xmlparser/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediametricsservice\",\n  shared_libs: [\"mediametricsservice-aidl-cpp\",\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libmemunreachable\",\"libprotobuf-cpp-lite\",\"libstagefright_foundation\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\"],\n  export_shared_lib_headers: [\"libstatspull\",\"libstatssocket\"],\n  static_libs: [\"libplatformprotos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediametricsservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmediametricsservice.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"mediametrics\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libmediametricsservice\",\"libmediautils\",\"libutils\",\"mediametricsservice-aidl-cpp\"],\n  init_rc: [\"mediametrics.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediametrics\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediametrics/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"librenderfright\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"liblog\",\"libnativewindow\",\"libprocessgroup\",\"libsync\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  clang: true,\n  lto: {\n    thin: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librenderfright.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/renderfright/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_bufferqueue_helper\",\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libstagefright_foundation\",\"libui\",\"libutils\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"libgui\"],\n  export_shared_lib_headers: [\"libhidlmemory\",\"libstagefright_foundation\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  min_sdk_version: \"29\",\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libgui\"],\n      static_libs: [\"libgui_bufferqueue_static\"],\n      shared_libs: [\"android.hidl.token@1.0-utils\",\"libEGL\",\"libnativewindow\",\"libvndksupport\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_bufferqueue_helper.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libstagefright_bufferqueue_helper_novndk\",\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"media_plugin_headers\"],\n  export_header_lib_headers: [\"media_plugin_headers\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libstagefright_foundation\",\"libui\",\"libutils\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hidl.token@1.0-utils\",\"libEGL\",\"libnativewindow\",\"libvndksupport\"],\n  export_shared_lib_headers: [\"libhidlmemory\",\"libstagefright_foundation\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  apex_available: [\"com.android.media.swcodec\",\"test_com.android.media.swcodec\",\"//apex_available:platform\"],\n  vendor_available: false,\n  min_sdk_version: \"29\",\n  static_libs: [\"libgui_bufferqueue_static\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_bufferqueue_helper_novndk.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/bqhelper/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.media.omx@1.0-service\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  shared_libs: [\"libbinder\",\"libutils\",\"liblog\",\"libbase\",\"libavservices_minijail\",\"libcutils\",\"libhidlbase\",\"libstagefright_omx\",\"libstagefright_xmlparser\",\"android.hardware.media.omx@1.0\",\"android.hidl.memory@1.0\"],\n  runtime_libs: [\"libstagefright_soft_aacdec\",\"libstagefright_soft_aacenc\",\"libstagefright_soft_amrdec\",\"libstagefright_soft_amrnbenc\",\"libstagefright_soft_amrwbenc\",\"libstagefright_soft_avcdec\",\"libstagefright_soft_avcenc\",\"libstagefright_soft_flacdec\",\"libstagefright_soft_flacenc\",\"libstagefright_soft_g711dec\",\"libstagefright_soft_gsmdec\",\"libstagefright_soft_hevcdec\",\"libstagefright_soft_mp3dec\",\"libstagefright_soft_mpeg2dec\",\"libstagefright_soft_mpeg4dec\",\"libstagefright_soft_mpeg4enc\",\"libstagefright_soft_opusdec\",\"libstagefright_soft_rawdec\",\"libstagefright_soft_vorbisdec\",\"libstagefright_soft_vpxdec\",\"libstagefright_soft_vpxenc\",\"libstagefright_softomx_plugin\"],\n  compile_multilib: \"32\",\n  init_rc: [\"android.hardware.media.omx@1.0-service.rc\"],\n  required: [\"mediacodec.policy\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.media.omx@1.0-service\"],\n}\ncc_prebuilt_binary {\n  name: \"mediaswcodec\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  shared_libs: [\"libavservices_minijail\",\"libbase\",\"libhidlbase\",\"liblog\",\"libmedia_codecserviceregistrant\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediaswcodec\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediacodec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsfplugin_ccodec\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.cas.native@1.0\",\"android.hardware.drm@1.0\",\"android.hardware.media.c2@1.0\",\"android.hardware.media.omx@1.0\",\"libbase\",\"libbinder\",\"libcodec2\",\"libcodec2_client\",\"libcodec2_vndk\",\"libcutils\",\"libgui\",\"libhidlallocatorutils\",\"libhidlbase\",\"liblog\",\"libmedia_codeclist\",\"libmedia_omx\",\"libsfplugin_ccodec_utils\",\"libstagefright_bufferqueue_helper\",\"libstagefright_codecbase\",\"libstagefright_foundation\",\"libstagefright_omx\",\"libstagefright_xmlparser\",\"libui\",\"libutils\"],\n  export_shared_lib_headers: [\"libcodec2\",\"libcodec2_client\"],\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsfplugin_ccodec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/sfplugin/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_codecserviceregistrant\",\n  shared_libs: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.c2@1.1\",\"android.hardware.media.c2@1.2\",\"libcodec2_hidl@1.0\",\"libcodec2_hidl@1.1\",\"libcodec2_hidl@1.2\",\"libcodec2_vndk\",\"libhidlbase\",\"libbase\",\"libutils\"],\n  vendor_available: true,\n  runtime_libs: [\"libcodec2_soft_avcdec\",\"libcodec2_soft_avcenc\",\"libcodec2_soft_aacdec\",\"libcodec2_soft_aacenc\",\"libcodec2_soft_amrnbdec\",\"libcodec2_soft_amrnbenc\",\"libcodec2_soft_amrwbdec\",\"libcodec2_soft_amrwbenc\",\"libcodec2_soft_hevcdec\",\"libcodec2_soft_hevcenc\",\"libcodec2_soft_g711alawdec\",\"libcodec2_soft_g711mlawdec\",\"libcodec2_soft_mpeg2dec\",\"libcodec2_soft_h263dec\",\"libcodec2_soft_h263enc\",\"libcodec2_soft_mpeg4dec\",\"libcodec2_soft_mpeg4enc\",\"libcodec2_soft_mp3dec\",\"libcodec2_soft_vorbisdec\",\"libcodec2_soft_opusdec\",\"libcodec2_soft_opusenc\",\"libcodec2_soft_vp8dec\",\"libcodec2_soft_vp9dec\",\"libcodec2_soft_av1dec_gav1\",\"libcodec2_soft_vp8enc\",\"libcodec2_soft_vp9enc\",\"libcodec2_soft_rawdec\",\"libcodec2_soft_flacdec\",\"libcodec2_soft_flacenc\",\"libcodec2_soft_gsmdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_codecserviceregistrant.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediacodec/registrant/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_color_conversion\",\n  shared_libs: [\"libui\",\"libnativewindow\"],\n  static_libs: [\"libyuv_static\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_color_conversion.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/colorconversion/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_aacdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libcutils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libFraunhoferAAC\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_aacdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacdec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_aacenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libFraunhoferAAC\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_aacenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/aacenc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_amrdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libstagefright_amrnb_common\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libstagefright_amrnbdec\",\"libstagefright_amrwbdec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_amrdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_amrnbenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libstagefright_amrnb_common\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libstagefright_amrnbenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_amrnbenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrnb/enc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_amrwbenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libstagefright_enc_common\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libstagefright_amrwbenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_amrwbenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/amrwbenc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_avcdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libavcdec\"],\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_avcdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcdec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_avcenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libavcenc\"],\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_avcenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/avcenc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_flacdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libstagefright_flacdec\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_flacdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_flacenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libaudioutils\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libFLAC\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_flacenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/flac/enc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_g711dec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_g711dec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/g711/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_gsmdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libgsm\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_gsmdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/gsm/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_hevcdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libhevcdec\"],\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_hevcdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/hevcdec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_mp3dec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  static_libs: [\"libstagefright_mp3dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_mp3dec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/mp3dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_mpeg2dec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libmpeg2dec\"],\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_mpeg2dec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/mpeg2dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_mpeg4dec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libstagefright_m4vh263dec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_mpeg4dec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_mpeg4enc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  static_libs: [\"libstagefright_m4vh263enc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_mpeg4enc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_opusdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libopus\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_opusdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/opus/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_rawdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_rawdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/raw/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_vorbisdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libvorbisidec\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_vorbisdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/vorbis/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_vpxdec\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libvpx\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_vpxdec.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_soft_vpxenc\",\n  vendor_available: true,\n  shared_libs: [\"libstagefright_softomx\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"libvpx\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  compile_multilib: \"32\",\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_soft_vpxenc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/on2/enc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-11
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-11.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_64_static/libfilterfw_native.a \
out/soong/.intermediates/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_x86_64_static/libfilterfw_native.a \
out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni_utils/android_x86_64_shared/libmedia_jni_utils.so \
out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni_utils/android_x86_x86_64_shared/libmedia_jni_utils.so \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a \
out/soong/.intermediates/frameworks/base/tools/validatekeymaps/validatekeymaps/linux_glibc_x86_64/validatekeymaps \


mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_64_static/libfilterfw_native.a prebuiltlibs/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_64_static/libfilterfw_native.a
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_x86_64_static/libfilterfw_native.a prebuiltlibs/frameworks/base/media/mca/filterfw/native/libfilterfw_native/android_x86_x86_64_static/libfilterfw_native.a
mkdir -p prebuiltlibs/frameworks/base/media/jni/libmedia_jni_utils/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni_utils/android_x86_64_shared/libmedia_jni_utils.so prebuiltlibs/frameworks/base/media/jni/libmedia_jni_utils/android_x86_64_shared/libmedia_jni_utils.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/libmedia_jni_utils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni_utils/android_x86_x86_64_shared/libmedia_jni_utils.so prebuiltlibs/frameworks/base/media/jni/libmedia_jni_utils/android_x86_x86_64_shared/libmedia_jni_utils.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/media/jni/ prebuiltlibs/frameworks/base/media/jni/
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/services/incremental/include/ prebuiltlibs/frameworks/base/services/incremental/include
mkdir -p prebuiltlibs/frameworks/base/tools/validatekeymaps/validatekeymaps/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/base/tools/validatekeymaps/validatekeymaps/linux_glibc_x86_64/validatekeymaps prebuiltlibs/frameworks/base/tools/validatekeymaps/validatekeymaps/linux_glibc_x86_64/validatekeymaps

printf "cc_prebuilt_library_static {\n  name: \"libfilterfw_native\",\n  static_libs: [\"libarect\"],\n  shared_libs: [\"libgui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfilterfw_native.a\"],\n}\n" >> prebuiltlibs/frameworks/base/media/mca/filterfw/native/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_jni_utils\",\n  shared_libs: [\"liblog\",\"libui\",\"libutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_jni_utils.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/jni/Android.bp
printf "cc_prebuilt_library {\n  name: \"service.incremental\",\n  static_libs: [\"libbase\",\"libext2_uuid\",\"libdataloader_aidl-cpp\",\"libincremental_aidl-cpp\",\"libincremental_manager_aidl-cpp\",\"libprotobuf-cpp-lite\",\"service.incremental.proto\",\"libutils\",\"libvold_binder\",\"libc++fs\",\"libziparchive_for_incfs\"],\n  shared_libs: [\"libandroidfw\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libincfs\",\"liblog\",\"libpermission\",\"libz\",\"libprotobuf-cpp-lite\"],\n  export_include_dirs: [\"include/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"service.incremental.a\"],\n  },\n  shared: {\n    srcs: [\"service.incremental.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/services/incremental/Android.bp
printf "cc_prebuilt_binary {\n  name: \"validatekeymaps\",\n  target: {\n    linux_glibc: {\n      static_libs: [\"libbinder\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"validatekeymaps\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/validatekeymaps/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-11
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-11.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so \
out/soong/.intermediates/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so \
out/soong/.intermediates/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice \
out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a \
out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a \
out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so \
out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so \
out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so \
out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so \
out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so \
out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so \
out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot \


mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so prebuiltlibs/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpustats/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/gpustats/include/ prebuiltlibs/frameworks/native/services/gpuservice/gpustats/include
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so prebuiltlibs/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpuservice/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice prebuiltlibs/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/ prebuiltlibs/frameworks/native/services/inputflinger/
mkdir -p prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so
mkdir -p prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so
mkdir -p prebuiltlibs/frameworks/native/services/stats/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/stats/include/ prebuiltlibs/frameworks/native/services/stats/include
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot prebuiltlibs/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot

printf "cc_prebuilt_library_shared {\n  name: \"libgfxstats\",\n  shared_libs: [\"libcutils\",\"libgraphicsenv\",\"liblog\",\"libprotoutil\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libstatspull\",\"libstatssocket\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgfxstats.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/gpustats/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpuservice\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libgfxstats\",\"libgpumem\",\"libgpumemtracer\",\"libgraphicsenv\",\"liblog\",\"libutils\",\"libvkjson\"],\n  static_libs: [\"libserviceutils\"],\n  export_static_lib_headers: [\"libserviceutils\"],\n  export_shared_lib_headers: [\"libgraphicsenv\"],\n  lto: {\n    thin: true,\n  },\n  whole_program_vtables: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpuservice.so\"],\n}\ncc_prebuilt_binary {\n  name: \"gpuservice\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libgpuservice\"],\n  init_rc: [\"gpuservice.rc\"],\n  required: [\"bpfloader\",\"gpu_mem.o\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gpuservice\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libinputdispatcher\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libinput\",\"libkll\",\"liblog\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libui\",\"libutils\",\"lib-platform-compat-native-api\",\"server_configurable_flags\",\"libinputreporter\",\"libinputflinger_base\"],\n  static_libs: [\"libattestation\"],\n  header_libs: [\"libinputdispatcher_headers\"],\n  export_header_lib_headers: [\"libinputdispatcher_headers\"],\n  logtags: [\"EventLogTags.logtags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputdispatcher.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputreader\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcap\",\"libcrypto\",\"libcutils\",\"libinput\",\"liblog\",\"libstatslog\",\"libui\",\"libutils\",\"libinputflinger_base\"],\n  static_libs: [\"libc++fs\"],\n  header_libs: [\"libinputreader_headers\"],\n  export_header_lib_headers: [\"libinputreader_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputreader.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/reader/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputflinger\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"android.hardware.input.classifier@1.0\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"libinput\",\"libkll\",\"liblog\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\",\"libui\",\"lib-platform-compat-native-api\",\"server_configurable_flags\",\"libinputflinger_base\",\"libinputreporter\",\"libinputreader\"],\n  static_libs: [\"libattestation\",\"libinputdispatcher\"],\n  export_static_lib_headers: [\"libinputdispatcher\"],\n  export_include_dirs: [\".\",\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputflinger.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstatshidl\",\n  shared_libs: [\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libstatslog\",\"libstatssocket\",\"libutils\"],\n  export_include_dirs: [\"include/\"],\n  export_shared_lib_headers: [\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\"],\n  vintf_fragments: [\"android.frameworks.stats@1.0-service.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatshidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/stats/Android.bp
printf "cc_prebuilt_binary {\n  name: \"otapreopt_chroot\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"libutils\"],\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  clang: true,\n  required: [\"apexd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"otapreopt_chroot\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-11
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-11.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_64_shared/libRScpp.so \
out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_64_static/libRScpp.a \
out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_x86_64_shared/libRScpp.so \
out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_x86_64_static/libRScpp.a \


mkdir -p prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_64_shared/libRScpp.so prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_64_shared/libRScpp.so
mkdir -p prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_64_static/libRScpp.a prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_64_static/libRScpp.a
mkdir -p prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_x86_64_shared/libRScpp.so prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_x86_64_shared/libRScpp.so
mkdir -p prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRScpp/android_x86_x86_64_static/libRScpp.a prebuiltlibs/frameworks/rs/cpp/libRScpp/android_x86_x86_64_static/libRScpp.a
mkdir -p prebuiltlibs/frameworks/rs/cpp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/rs/cpp/ prebuiltlibs/frameworks/rs/cpp/

printf "cc_prebuilt_library {\n  name: \"libRScpp\",\n  header_libs: [\"jni_headers\",\"rs-headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"rs-headers\"],\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libdl\",\"liblog\",\"libgui\",\"libutils\"],\n  static_libs: [\"libRSDispatch\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libRScpp.a\"],\n  },\n  shared: {\n    srcs: [\"libRScpp.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/rs/cpp/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-11
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-11.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_64_shared/libgooglecamerahalutils.so \
out/soong/.intermediates/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_x86_64_shared/libgooglecamerahalutils.so \
out/soong/.intermediates/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal/android_vendor.31_x86_64_shared/libgooglecamerahal.so \
out/soong/.intermediates/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google/android_vendor.31_x86_64/android.hardware.camera.provider@2.7-service-google \
out/soong/.intermediates/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_64_shared/libgooglecamerahwl_impl.so \
out/soong/.intermediates/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_x86_64_shared/libgooglecamerahwl_impl.so \


mkdir -p prebuiltlibs/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_64_shared/libgooglecamerahalutils.so prebuiltlibs/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_64_shared/libgooglecamerahalutils.so
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_x86_64_shared/libgooglecamerahalutils.so prebuiltlibs/hardware/google/camera/common/hal/utils/libgooglecamerahalutils/android_vendor.31_x86_x86_64_shared/libgooglecamerahalutils.so
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/utils/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/hal/utils/ prebuiltlibs/hardware/google/camera/common/hal/utils/
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal/android_vendor.31_x86_64_shared/libgooglecamerahal.so prebuiltlibs/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal/android_vendor.31_x86_64_shared/libgooglecamerahal.so
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/google_camera_hal/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/hal/google_camera_hal/ prebuiltlibs/hardware/google/camera/common/hal/google_camera_hal/
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google/android_vendor.31_x86_64/ && mv out/soong/.intermediates/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google/android_vendor.31_x86_64/android.hardware.camera.provider@2.7-service-google prebuiltlibs/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google/android_vendor.31_x86_64/android.hardware.camera.provider@2.7-service-google
mkdir -p prebuiltlibs/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_64_shared/libgooglecamerahwl_impl.so prebuiltlibs/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_64_shared/libgooglecamerahwl_impl.so
mkdir -p prebuiltlibs/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_x86_64_shared/libgooglecamerahwl_impl.so prebuiltlibs/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl/android_vendor.31_x86_x86_64_shared/libgooglecamerahwl_impl.so

printf "cc_prebuilt_library_shared {\n  name: \"libgooglecamerahalutils\",\n  owner: \"google\",\n  vendor: true,\n  shared_libs: [\"lib_profiler\",\"libcamera_metadata\",\"libcutils\",\"libgrallocusage\",\"libhardware\",\"liblog\",\"libutils\",\"libui\",\"libsync\"],\n  export_shared_lib_headers: [\"lib_profiler\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgooglecamerahalutils.so\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/hal/utils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgooglecamerahal\",\n  header_libs: [\"libgooglecamerahal_headers\"],\n  owner: \"google\",\n  vendor: true,\n  compile_multilib: \"first\",\n  shared_libs: [\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"lib_profiler\",\"libbase\",\"libcamera_metadata\",\"libcutils\",\"libgooglecamerahalutils\",\"libhidlbase\",\"liblog\",\"libmeminfo\",\"libutils\",\"libsync\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libgooglecamerahal_headers\"],\n  export_shared_lib_headers: [\"lib_profiler\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgooglecamerahal.so\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/hal/google_camera_hal/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.camera.provider@2.7-service-google\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  compile_multilib: \"first\",\n  shared_libs: [\"android.hardware.camera.device@3.2\",\"android.hardware.camera.device@3.3\",\"android.hardware.camera.device@3.4\",\"android.hardware.camera.device@3.5\",\"android.hardware.camera.device@3.6\",\"android.hardware.camera.device@3.7\",\"android.hardware.camera.provider@2.4\",\"android.hardware.camera.provider@2.5\",\"android.hardware.camera.provider@2.6\",\"android.hardware.camera.provider@2.7\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"android.hardware.thermal@2.0\",\"libbinder\",\"libbase\",\"libcamera_metadata\",\"libcutils\",\"libfmq\",\"libgooglecamerahal\",\"libgooglecamerahalutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"lib_profiler\"],\n  export_shared_lib_headers: [\"lib_profiler\"],\n  vintf_fragments: [\"android.hardware.camera.provider@2.7-service-google.xml\"],\n  init_rc: [\"android.hardware.camera.provider@2.7-service-google.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.camera.provider@2.7-service-google\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/hal/hidl_service/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgooglecamerahwl_impl\",\n  owner: \"google\",\n  proprietary: true,\n  shared_libs: [\"android.frameworks.sensorservice@1.0\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"android.hardware.camera.provider@2.4\",\"android.hardware.camera.provider@2.5\",\"android.hardware.camera.provider@2.6\",\"android.hardware.camera.provider@2.7\",\"android.hardware.sensors@1.0\",\"android.hidl.allocator@1.0\",\"lib_profiler\",\"libbase\",\"libcamera_metadata\",\"libcutils\",\"libexif\",\"libgralloctypes\",\"libhardware\",\"libhidlbase\",\"libgooglecamerahalutils\",\"libjpeg\",\"libjsoncpp\",\"liblog\",\"libsync\",\"libutils\",\"libyuv\"],\n  static_libs: [\"android.hardware.camera.common@1.0-helper\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgooglecamerahwl_impl.so\"],\n}\n" >> prebuiltlibs/hardware/google/camera/devices/EmulatedCamera/hwl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/google/camera/ninja && rsync -ar out/soong/ninja/hardware/google/camera/ prebuiltlibs/hardware/google/camera/ninja/hardware_google_camera-11
touch prebuiltlibs/hardware/google/camera/ninja/.find-ignore
tar cfJ hardware_google_camera-11.tar.xz -C prebuiltlibs/hardware/google/camera/ .
ls -l hardware_google_camera-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/apps/Gallery2/jni/libjni_eglfence/android_x86_64_shared/libjni_eglfence.so \


mkdir -p prebuiltlibs/packages/apps/Gallery2/jni/libjni_eglfence/android_x86_64_shared/ && mv out/soong/.intermediates/packages/apps/Gallery2/jni/libjni_eglfence/android_x86_64_shared/libjni_eglfence.so prebuiltlibs/packages/apps/Gallery2/jni/libjni_eglfence/android_x86_64_shared/libjni_eglfence.so

printf "cc_prebuilt_library_shared {\n  name: \"libjni_eglfence\",\n  product_specific: true,\n  sdk_version: \"9\",\n  shared_libs: [\"liblog\",\"libEGL\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjni_eglfence.so\"],\n}\n" >> prebuiltlibs/packages/apps/Gallery2/jni/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/apps/Gallery2/ninja && rsync -ar out/soong/ninja/packages/apps/Gallery2/ prebuiltlibs/packages/apps/Gallery2/ninja/packages_apps_Gallery2-11
touch prebuiltlibs/packages/apps/Gallery2/ninja/.find-ignore
tar cfJ packages_apps_Gallery2-11.tar.xz -C prebuiltlibs/packages/apps/Gallery2/ .
ls -l packages_apps_Gallery2-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/NeuralNetworks/shim_and_sl/neuralnetworks_supportlibrary_loader/android_vendor.31_x86_64_static/neuralnetworks_supportlibrary_loader.a \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_64_static_apex30/neuralnetworks_types.a \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_x86_64_static_apex30/neuralnetworks_types.a \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_vendor.31_x86_64_static/neuralnetworks_types.a \


mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/neuralnetworks_supportlibrary_loader/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/shim_and_sl/neuralnetworks_supportlibrary_loader/android_vendor.31_x86_64_static/neuralnetworks_supportlibrary_loader.a prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/neuralnetworks_supportlibrary_loader/android_vendor.31_x86_64_static/neuralnetworks_supportlibrary_loader.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/shim_and_sl/include/ prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/include
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/public
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/shim_and_sl/public/ prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/public
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_64_static_apex30/neuralnetworks_types.a prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_64_static_apex30/neuralnetworks_types.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_x86_64_static_apex30/neuralnetworks_types.a prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_x86_x86_64_static_apex30/neuralnetworks_types.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_vendor.31_x86_64_static/neuralnetworks_types.a prebuiltlibs/packages/modules/NeuralNetworks/common/neuralnetworks_types/android_vendor.31_x86_64_static/neuralnetworks_types.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/common/include/ prebuiltlibs/packages/modules/NeuralNetworks/common/include

printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_supportlibrary_loader\",\n  shared_libs: [\"libnativewindow\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  export_include_dirs: [\"include\",\"public\"],\n  static_libs: [\"libarect\",\"libbase\"],\n  licenses: [\"Android-Apache-2.0\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_supportlibrary_loader.a\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_types\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  target: {\n    android: {\n      shared_libs: [\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libhidlbase\",\"libhidlmemory\",\"libnativewindow\"],\n      static_libs: [\"libarect\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libutils\"],\n  export_shared_lib_headers: [\"libbase\",\"libcutils\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_types.a\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/common/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/ninja && rsync -ar out/soong/ninja/packages/modules/NeuralNetworks/ prebuiltlibs/packages/modules/NeuralNetworks/ninja/packages_modules_NeuralNetworks-11
touch prebuiltlibs/packages/modules/NeuralNetworks/ninja/.find-ignore
tar cfJ packages_modules_NeuralNetworks-11.tar.xz -C prebuiltlibs/packages/modules/NeuralNetworks/ .
ls -l packages_modules_NeuralNetworks-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Virtualization/authfs/authfs/android_x86_64_apex10000/authfs \


mkdir -p prebuiltlibs/packages/modules/Virtualization/authfs/authfs/android_x86_64_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/authfs/authfs/android_x86_64_apex10000/authfs prebuiltlibs/packages/modules/Virtualization/authfs/authfs/android_x86_64_apex10000/authfs

printf "cc_prebuilt_binary {\n  name: \"authfs\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"authfs\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/authfs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Virtualization/ninja && rsync -ar out/soong/ninja/packages/modules/Virtualization/ prebuiltlibs/packages/modules/Virtualization/ninja/packages_modules_Virtualization-11
touch prebuiltlibs/packages/modules/Virtualization/ninja/.find-ignore
tar cfJ packages_modules_Virtualization-11.tar.xz -C prebuiltlibs/packages/modules/Virtualization/ .
ls -l packages_modules_Virtualization-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a \
out/soong/.intermediates/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a \
out/soong/.intermediates/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a \
out/soong/.intermediates/system/apex/apexd/apexd/android_x86_64/apexd \


mkdir -p prebuiltlibs/system/apex/apexd/libapexd/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a prebuiltlibs/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a
mkdir -p prebuiltlibs/system/apex/apexd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/apex/apexd/ prebuiltlibs/system/apex/apexd/
mkdir -p prebuiltlibs/system/apex/apexd/libapexservice/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a prebuiltlibs/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a
mkdir -p prebuiltlibs/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a prebuiltlibs/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a
mkdir -p prebuiltlibs/system/apex/apexd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/apex/apexd/ prebuiltlibs/system/apex/apexd/
mkdir -p prebuiltlibs/system/apex/apexd/apexd/android_x86_64/ && mv out/soong/.intermediates/system/apex/apexd/apexd/android_x86_64/apexd prebuiltlibs/system/apex/apexd/apexd/android_x86_64/apexd

printf "cc_prebuilt_library_static {\n  name: \"libapexd\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\",\"libapex\",\"libdm\",\"libext2_uuid\",\"libverity_tree\",\"libvold_binder\",\"libxml2\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexd.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libapexservice\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"apex_aidl_interface-cpp\",\"libutils\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\",\"libapex\",\"libdm\",\"libext2_uuid\",\"libverity_tree\",\"libvold_binder\",\"libxml2\",\"libapexd\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexservice.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libapexd_checkpoint_vold\",\n  static_libs: [\"libbase\",\"libutils\",\"libvold_binder\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexd_checkpoint_vold.a\"],\n}\ncc_prebuilt_binary {\n  name: \"apexd\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"apex_aidl_interface-cpp\",\"libutils\"],\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  init_rc: [\"apexd.rc\"],\n  bootstrap: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"apexd\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/apex/ninja && rsync -ar out/soong/ninja/system/apex/ prebuiltlibs/system/apex/ninja/system_apex-11
touch prebuiltlibs/system/apex/ninja/.find-ignore
tar cfJ system_apex-11.tar.xz -C prebuiltlibs/system/apex/ .
ls -l system_apex-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/gd/rust/common/libbt_common/android_x86_64_rlib_rlib-std/libbt_common.rlib \
out/soong/.intermediates/system/bt/gd/rust/common/libbt_common/android_x86_x86_64_rlib_rlib-std/libbt_common.rlib \
out/soong/.intermediates/system/bt/gd/libbt_facade_proto/android_x86_64_rlib_rlib-std/libbt_facade_proto.rlib \
out/soong/.intermediates/system/bt/gd/libbt_facade_proto/android_x86_x86_64_rlib_rlib-std/libbt_facade_proto.rlib \
out/soong/.intermediates/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib \
out/soong/.intermediates/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib \
out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hal/android_x86_64_rlib_rlib-std/libbt_hal.rlib \
out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hal/android_x86_x86_64_rlib_rlib-std/libbt_hal.rlib \
out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci/android_x86_64_rlib_rlib-std/libbt_hci.rlib \
out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci/android_x86_x86_64_rlib_rlib-std/libbt_hci.rlib \
out/soong/.intermediates/system/bt/gd/rust/main/libbt_main/android_x86_64_rlib_rlib-std/libbt_main.rlib \
out/soong/.intermediates/system/bt/gd/rust/main/libbt_main/android_x86_x86_64_rlib_rlib-std/libbt_main.rlib \
out/soong/.intermediates/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_64_static/libbt_shim_ffi.a \
out/soong/.intermediates/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_x86_64_static/libbt_shim_ffi.a \
out/soong/.intermediates/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_64_static/libbluetooth_rust_interop.a \
out/soong/.intermediates/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_x86_64_static/libbluetooth_rust_interop.a \
out/soong/.intermediates/system/bt/gd/libbluetooth_gd/android_x86_64_static/libbluetooth_gd.a \
out/soong/.intermediates/system/bt/gd/libbluetooth_gd/android_x86_x86_64_static/libbluetooth_gd.a \
out/soong/.intermediates/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_64_static/libaudio-a2dp-hw-utils.a \
out/soong/.intermediates/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_x86_64_static/libaudio-a2dp-hw-utils.a \
out/soong/.intermediates/system/bt/common/libbt-common/android_x86_64_static/libbt-common.a \
out/soong/.intermediates/system/bt/common/libbt-common/android_x86_x86_64_static/libbt-common.a \
out/soong/.intermediates/system/bt/hci/libbt-hci/android_x86_64_static/libbt-hci.a \
out/soong/.intermediates/system/bt/hci/libbt-hci/android_x86_x86_64_static/libbt-hci.a \
out/soong/.intermediates/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_64_static/libbt-sbc-decoder.a \
out/soong/.intermediates/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_x86_64_static/libbt-sbc-decoder.a \
out/soong/.intermediates/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_64_static/libbt-sbc-encoder.a \
out/soong/.intermediates/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_x86_64_static/libbt-sbc-encoder.a \
out/soong/.intermediates/system/bt/stack/libbt-stack/android_x86_64_static/libbt-stack.a \
out/soong/.intermediates/system/bt/stack/libbt-stack/android_x86_x86_64_static/libbt-stack.a \
out/soong/.intermediates/system/bt/utils/libbt-utils/android_x86_64_static/libbt-utils.a \
out/soong/.intermediates/system/bt/utils/libbt-utils/android_x86_x86_64_static/libbt-utils.a \
out/soong/.intermediates/system/bt/btcore/libbtcore/android_x86_64_static/libbtcore.a \
out/soong/.intermediates/system/bt/btcore/libbtcore/android_x86_x86_64_static/libbtcore.a \
out/soong/.intermediates/system/bt/device/libbtdevice/android_x86_64_static/libbtdevice.a \
out/soong/.intermediates/system/bt/device/libbtdevice/android_x86_x86_64_static/libbtdevice.a \
out/soong/.intermediates/system/bt/main/libbte/android_x86_64_static/libbte.a \
out/soong/.intermediates/system/bt/main/libbte/android_x86_x86_64_static/libbte.a \
out/soong/.intermediates/system/bt/embdrv/g722/libg722codec/android_x86_64_static/libg722codec.a \
out/soong/.intermediates/system/bt/embdrv/g722/libg722codec/android_x86_x86_64_static/libg722codec.a \
out/soong/.intermediates/system/bt/osi/libosi/android_x86_64_static/libosi.a \
out/soong/.intermediates/system/bt/osi/libosi/android_x86_x86_64_static/libosi.a \
out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_shared/audio.a2dp.default.so \
out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_static/audio.a2dp.default.a \
out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_shared/audio.a2dp.default.so \
out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_static/audio.a2dp.default.a \
out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_shared/audio.hearing_aid.default.so \
out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_static/audio.hearing_aid.default.a \
out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_shared/audio.hearing_aid.default.so \
out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_static/audio.hearing_aid.default.a \
out/soong/.intermediates/system/bt/profile/avrcp/avrcp-target-service/android_x86_64_static/avrcp-target-service.a \
out/soong/.intermediates/system/bt/profile/avrcp/avrcp-target-service/android_x86_x86_64_static/avrcp-target-service.a \
out/soong/.intermediates/system/bt/bta/libbt-bta/android_x86_64_static/libbt-bta.a \
out/soong/.intermediates/system/bt/bta/libbt-bta/android_x86_x86_64_static/libbt-bta.a \
out/soong/.intermediates/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_64_static/libbt-audio-hal-interface.a \
out/soong/.intermediates/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_x86_64_static/libbt-audio-hal-interface.a \
out/soong/.intermediates/system/bt/btif/libbtif/android_x86_64_static/libbtif.a \
out/soong/.intermediates/system/bt/btif/libbtif/android_x86_x86_64_static/libbtif.a \
out/soong/.intermediates/system/bt/udrv/libudrv-uipc/android_x86_64_static/libudrv-uipc.a \
out/soong/.intermediates/system/bt/udrv/libudrv-uipc/android_x86_x86_64_static/libudrv-uipc.a \
out/soong/.intermediates/system/bt/main/libbluetooth/android_x86_64_shared/libbluetooth.so \
out/soong/.intermediates/system/bt/main/libbluetooth/android_x86_x86_64_shared/libbluetooth.so \


mkdir -p prebuiltlibs/system/bt/gd/rust/common/libbt_common/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/common/libbt_common/android_x86_64_rlib_rlib-std/libbt_common.rlib prebuiltlibs/system/bt/gd/rust/common/libbt_common/android_x86_64_rlib_rlib-std/libbt_common.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/common/libbt_common/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/common/libbt_common/android_x86_x86_64_rlib_rlib-std/libbt_common.rlib prebuiltlibs/system/bt/gd/rust/common/libbt_common/android_x86_x86_64_rlib_rlib-std/libbt_common.rlib
mkdir -p prebuiltlibs/system/bt/gd/libbt_facade_proto/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/libbt_facade_proto/android_x86_64_rlib_rlib-std/libbt_facade_proto.rlib prebuiltlibs/system/bt/gd/libbt_facade_proto/android_x86_64_rlib_rlib-std/libbt_facade_proto.rlib
mkdir -p prebuiltlibs/system/bt/gd/libbt_facade_proto/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/libbt_facade_proto/android_x86_x86_64_rlib_rlib-std/libbt_facade_proto.rlib prebuiltlibs/system/bt/gd/libbt_facade_proto/android_x86_x86_64_rlib_rlib-std/libbt_facade_proto.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib prebuiltlibs/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib prebuiltlibs/system/bt/gd/rust/facade/libbt_facade_helpers/android_x86_x86_64_rlib_rlib-std/libbt_facade_helpers.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hal/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hal/android_x86_64_rlib_rlib-std/libbt_hal.rlib prebuiltlibs/system/bt/gd/rust/hal/libbt_hal/android_x86_64_rlib_rlib-std/libbt_hal.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hal/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hal/android_x86_x86_64_rlib_rlib-std/libbt_hal.rlib prebuiltlibs/system/bt/gd/rust/hal/libbt_hal/android_x86_x86_64_rlib_rlib-std/libbt_hal.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/hci/libbt_hci/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci/android_x86_64_rlib_rlib-std/libbt_hci.rlib prebuiltlibs/system/bt/gd/rust/hci/libbt_hci/android_x86_64_rlib_rlib-std/libbt_hci.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/hci/libbt_hci/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci/android_x86_x86_64_rlib_rlib-std/libbt_hci.rlib prebuiltlibs/system/bt/gd/rust/hci/libbt_hci/android_x86_x86_64_rlib_rlib-std/libbt_hci.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/main/libbt_main/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/main/libbt_main/android_x86_64_rlib_rlib-std/libbt_main.rlib prebuiltlibs/system/bt/gd/rust/main/libbt_main/android_x86_64_rlib_rlib-std/libbt_main.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/main/libbt_main/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/main/libbt_main/android_x86_x86_64_rlib_rlib-std/libbt_main.rlib prebuiltlibs/system/bt/gd/rust/main/libbt_main/android_x86_x86_64_rlib_rlib-std/libbt_main.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_64_static/libbt_shim_ffi.a prebuiltlibs/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_64_static/libbt_shim_ffi.a
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_x86_64_static/libbt_shim_ffi.a prebuiltlibs/system/bt/gd/rust/shim/libbt_shim_ffi/android_x86_x86_64_static/libbt_shim_ffi.a
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_64_static/libbluetooth_rust_interop.a prebuiltlibs/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_64_static/libbluetooth_rust_interop.a
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_x86_64_static/libbluetooth_rust_interop.a prebuiltlibs/system/bt/gd/rust/shim/libbluetooth_rust_interop/android_x86_x86_64_static/libbluetooth_rust_interop.a
rsync -ar out/soong/.intermediates/system/bt/gd/rust/shim/libbt_init_flags_bridge_header/gen prebuiltlibs/system/bt/gd/rust/shim/
rsync -ar out/soong/.intermediates/system/bt/gd/rust/shim/libbt_shim_bridge_header/gen prebuiltlibs/system/bt/gd/rust/shim/
rsync -ar out/soong/.intermediates/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header/gen prebuiltlibs/system/bt/gd/rust/shim/
rsync -ar out/soong/.intermediates/external/rust/cxx/cxx-bridge-header/gen prebuiltlibs/system/bt/gd/rust/shim/
mkdir -p prebuiltlibs/system/bt/gd/libbluetooth_gd/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/libbluetooth_gd/android_x86_64_static/libbluetooth_gd.a prebuiltlibs/system/bt/gd/libbluetooth_gd/android_x86_64_static/libbluetooth_gd.a
mkdir -p prebuiltlibs/system/bt/gd/libbluetooth_gd/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/libbluetooth_gd/android_x86_x86_64_static/libbluetooth_gd.a prebuiltlibs/system/bt/gd/libbluetooth_gd/android_x86_x86_64_static/libbluetooth_gd.a
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_64_static/libaudio-a2dp-hw-utils.a prebuiltlibs/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_64_static/libaudio-a2dp-hw-utils.a
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_x86_64_static/libaudio-a2dp-hw-utils.a prebuiltlibs/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils/android_x86_x86_64_static/libaudio-a2dp-hw-utils.a
mkdir -p prebuiltlibs/system/bt/common/libbt-common/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/common/libbt-common/android_x86_64_static/libbt-common.a prebuiltlibs/system/bt/common/libbt-common/android_x86_64_static/libbt-common.a
mkdir -p prebuiltlibs/system/bt/common/libbt-common/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/common/libbt-common/android_x86_x86_64_static/libbt-common.a prebuiltlibs/system/bt/common/libbt-common/android_x86_x86_64_static/libbt-common.a
mkdir -p prebuiltlibs/system/bt/hci/libbt-hci/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/hci/libbt-hci/android_x86_64_static/libbt-hci.a prebuiltlibs/system/bt/hci/libbt-hci/android_x86_64_static/libbt-hci.a
mkdir -p prebuiltlibs/system/bt/hci/libbt-hci/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/hci/libbt-hci/android_x86_x86_64_static/libbt-hci.a prebuiltlibs/system/bt/hci/libbt-hci/android_x86_x86_64_static/libbt-hci.a
mkdir -p prebuiltlibs/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_64_static/libbt-sbc-decoder.a prebuiltlibs/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_64_static/libbt-sbc-decoder.a
mkdir -p prebuiltlibs/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_x86_64_static/libbt-sbc-decoder.a prebuiltlibs/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder/android_x86_x86_64_static/libbt-sbc-decoder.a
mkdir -p prebuiltlibs/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_64_static/libbt-sbc-encoder.a prebuiltlibs/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_64_static/libbt-sbc-encoder.a
mkdir -p prebuiltlibs/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_x86_64_static/libbt-sbc-encoder.a prebuiltlibs/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder/android_x86_x86_64_static/libbt-sbc-encoder.a
mkdir -p prebuiltlibs/system/bt/stack/libbt-stack/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/stack/libbt-stack/android_x86_64_static/libbt-stack.a prebuiltlibs/system/bt/stack/libbt-stack/android_x86_64_static/libbt-stack.a
mkdir -p prebuiltlibs/system/bt/stack/libbt-stack/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/stack/libbt-stack/android_x86_x86_64_static/libbt-stack.a prebuiltlibs/system/bt/stack/libbt-stack/android_x86_x86_64_static/libbt-stack.a
mkdir -p prebuiltlibs/system/bt/utils/libbt-utils/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/utils/libbt-utils/android_x86_64_static/libbt-utils.a prebuiltlibs/system/bt/utils/libbt-utils/android_x86_64_static/libbt-utils.a
mkdir -p prebuiltlibs/system/bt/utils/libbt-utils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/utils/libbt-utils/android_x86_x86_64_static/libbt-utils.a prebuiltlibs/system/bt/utils/libbt-utils/android_x86_x86_64_static/libbt-utils.a
mkdir -p prebuiltlibs/system/bt/btcore/libbtcore/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/btcore/libbtcore/android_x86_64_static/libbtcore.a prebuiltlibs/system/bt/btcore/libbtcore/android_x86_64_static/libbtcore.a
mkdir -p prebuiltlibs/system/bt/btcore/libbtcore/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/btcore/libbtcore/android_x86_x86_64_static/libbtcore.a prebuiltlibs/system/bt/btcore/libbtcore/android_x86_x86_64_static/libbtcore.a
mkdir -p prebuiltlibs/system/bt/device/libbtdevice/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/device/libbtdevice/android_x86_64_static/libbtdevice.a prebuiltlibs/system/bt/device/libbtdevice/android_x86_64_static/libbtdevice.a
mkdir -p prebuiltlibs/system/bt/device/libbtdevice/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/device/libbtdevice/android_x86_x86_64_static/libbtdevice.a prebuiltlibs/system/bt/device/libbtdevice/android_x86_x86_64_static/libbtdevice.a
mkdir -p prebuiltlibs/system/bt/main/libbte/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/main/libbte/android_x86_64_static/libbte.a prebuiltlibs/system/bt/main/libbte/android_x86_64_static/libbte.a
mkdir -p prebuiltlibs/system/bt/main/libbte/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/main/libbte/android_x86_x86_64_static/libbte.a prebuiltlibs/system/bt/main/libbte/android_x86_x86_64_static/libbte.a
mkdir -p prebuiltlibs/system/bt/embdrv/g722/libg722codec/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/g722/libg722codec/android_x86_64_static/libg722codec.a prebuiltlibs/system/bt/embdrv/g722/libg722codec/android_x86_64_static/libg722codec.a
mkdir -p prebuiltlibs/system/bt/embdrv/g722/libg722codec/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/embdrv/g722/libg722codec/android_x86_x86_64_static/libg722codec.a prebuiltlibs/system/bt/embdrv/g722/libg722codec/android_x86_x86_64_static/libg722codec.a
mkdir -p prebuiltlibs/system/bt/osi/libosi/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/osi/libosi/android_x86_64_static/libosi.a prebuiltlibs/system/bt/osi/libosi/android_x86_64_static/libosi.a
mkdir -p prebuiltlibs/system/bt/osi/libosi/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/osi/libosi/android_x86_x86_64_static/libosi.a prebuiltlibs/system/bt/osi/libosi/android_x86_x86_64_static/libosi.a
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_shared/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_shared/audio.a2dp.default.so prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_shared/audio.a2dp.default.so
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_static/audio.a2dp.default.a prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_64_static/audio.a2dp.default.a
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_shared/audio.a2dp.default.so prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_shared/audio.a2dp.default.so
mkdir -p prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_static/audio.a2dp.default.a prebuiltlibs/system/bt/audio_a2dp_hw/audio.a2dp.default/android_x86_x86_64_static/audio.a2dp.default.a
mkdir -p prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_shared/ && mv out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_shared/audio.hearing_aid.default.so prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_shared/audio.hearing_aid.default.so
mkdir -p prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_static/audio.hearing_aid.default.a prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_64_static/audio.hearing_aid.default.a
mkdir -p prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_shared/audio.hearing_aid.default.so prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_shared/audio.hearing_aid.default.so
mkdir -p prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_static/audio.hearing_aid.default.a prebuiltlibs/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default/android_x86_x86_64_static/audio.hearing_aid.default.a
mkdir -p prebuiltlibs/system/bt/profile/avrcp/avrcp-target-service/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/profile/avrcp/avrcp-target-service/android_x86_64_static/avrcp-target-service.a prebuiltlibs/system/bt/profile/avrcp/avrcp-target-service/android_x86_64_static/avrcp-target-service.a
mkdir -p prebuiltlibs/system/bt/profile/avrcp/avrcp-target-service/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/profile/avrcp/avrcp-target-service/android_x86_x86_64_static/avrcp-target-service.a prebuiltlibs/system/bt/profile/avrcp/avrcp-target-service/android_x86_x86_64_static/avrcp-target-service.a
mkdir -p prebuiltlibs/system/bt/profile/avrcp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bt/profile/avrcp/ prebuiltlibs/system/bt/profile/avrcp/
mkdir -p prebuiltlibs/system/bt/bta/libbt-bta/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/bta/libbt-bta/android_x86_64_static/libbt-bta.a prebuiltlibs/system/bt/bta/libbt-bta/android_x86_64_static/libbt-bta.a
mkdir -p prebuiltlibs/system/bt/bta/libbt-bta/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/bta/libbt-bta/android_x86_x86_64_static/libbt-bta.a prebuiltlibs/system/bt/bta/libbt-bta/android_x86_x86_64_static/libbt-bta.a
mkdir -p prebuiltlibs/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_64_static/libbt-audio-hal-interface.a prebuiltlibs/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_64_static/libbt-audio-hal-interface.a
mkdir -p prebuiltlibs/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_x86_64_static/libbt-audio-hal-interface.a prebuiltlibs/system/bt/audio_hal_interface/libbt-audio-hal-interface/android_x86_x86_64_static/libbt-audio-hal-interface.a
mkdir -p prebuiltlibs/system/bt/btif/libbtif/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/btif/libbtif/android_x86_64_static/libbtif.a prebuiltlibs/system/bt/btif/libbtif/android_x86_64_static/libbtif.a
mkdir -p prebuiltlibs/system/bt/btif/libbtif/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/btif/libbtif/android_x86_x86_64_static/libbtif.a prebuiltlibs/system/bt/btif/libbtif/android_x86_x86_64_static/libbtif.a
mkdir -p prebuiltlibs/system/bt/udrv/libudrv-uipc/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/udrv/libudrv-uipc/android_x86_64_static/libudrv-uipc.a prebuiltlibs/system/bt/udrv/libudrv-uipc/android_x86_64_static/libudrv-uipc.a
mkdir -p prebuiltlibs/system/bt/udrv/libudrv-uipc/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/udrv/libudrv-uipc/android_x86_x86_64_static/libudrv-uipc.a prebuiltlibs/system/bt/udrv/libudrv-uipc/android_x86_x86_64_static/libudrv-uipc.a
mkdir -p prebuiltlibs/system/bt/main/libbluetooth/android_x86_64_shared/ && mv out/soong/.intermediates/system/bt/main/libbluetooth/android_x86_64_shared/libbluetooth.so prebuiltlibs/system/bt/main/libbluetooth/android_x86_64_shared/libbluetooth.so
mkdir -p prebuiltlibs/system/bt/main/libbluetooth/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/bt/main/libbluetooth/android_x86_x86_64_shared/libbluetooth.so prebuiltlibs/system/bt/main/libbluetooth/android_x86_x86_64_shared/libbluetooth.so

printf "rust_prebuilt_rlib {\n  name: \"libbt_common\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      rustlibs: [\"libandroid_logger\"],\n      whole_static_libs: [\"libbt_common_sys_prop_cxx\"],\n      shared_libs: [\"libcutils\"],\n    },\n    host: {\n      rustlibs: [\"libenv_logger\"],\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_common\",\n  edition: \"2018\",\n  rustlibs: [\"libtokio\",\"libnix\",\"liblazy_static\",\"liblog_rust\",\"libcxx\",\"libgrpcio\"],\n  proc_macros: [\"libpaste\"],\n  multiple_variants: true,\n  srcs: [\"libbt_common.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/common/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbt_facade_proto\",\n  crate_name: \"bt_facade_proto\",\n  host_supported: true,\n  multiple_variants: true,\n  srcs: [\"libbt_facade_proto.rlib\"],\n}\ncc_prebuilt_library {\n  name: \"libbluetooth_gd\",\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"android.system.suspend.control-V1-ndk\",\"android.system.suspend@1.0\",\"libbinder_ndk\",\"libcutils\",\"libhidlbase\",\"libutils\",\"libstatslog\"],\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux: {\n    },\n  },\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  host_supported: true,\n  shared_libs: [\"libchrome\",\"libcrypto\",\"libflatbuffers-cpp\",\"libgrpc++\",\"libgrpc_wrap\"],\n  static_libs: [\"libbluetooth-protos\",\"libbluetooth_rust_interop\",\"libbt-platform-protos-lite\"],\n  export_static_lib_headers: [\"libbluetooth_rust_interop\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth_gd.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbt_facade_helpers\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_facade_helpers\",\n  edition: \"2018\",\n  rustlibs: [\"libbt_facade_proto\",\"libbt_packets\",\"libbytes\",\"libfutures\",\"libgrpcio\",\"libtokio\",\"libprotobuf\",\"liblog_rust\",\"libcxx\"],\n  multiple_variants: true,\n  srcs: [\"libbt_facade_helpers.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/facade/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbt_hal\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      whole_static_libs: [\"libbt_hidl_hal_cxx\"],\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libhidlbase\",\"libutils\"],\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_hal\",\n  edition: \"2018\",\n  rustlibs: [\"libbt_facade_proto\",\"libbt_packets\",\"libbytes\",\"libfutures\",\"libthiserror\",\"libgrpcio\",\"libtokio\",\"libprotobuf\",\"libgddi\",\"libcxx\",\"liblazy_static\",\"liblog_rust\",\"libbt_common\",\"libnum_traits\",\"libbt_facade_helpers\"],\n  proc_macros: [\"libnum_derive\"],\n  multiple_variants: true,\n  srcs: [\"libbt_hal.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/hal/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbt_hci\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_hci\",\n  edition: \"2018\",\n  rustlibs: [\"libbt_hal\",\"libbt_facade_proto\",\"libbt_packets\",\"libbytes\",\"libfutures\",\"libgrpcio\",\"libnum_traits\",\"libthiserror\",\"libtokio\",\"libprotobuf\",\"libgddi\",\"liblog_rust\",\"libbt_common\",\"libbt_hci_custom_types\",\"libbt_facade_helpers\"],\n  proc_macros: [\"libnum_derive\"],\n  multiple_variants: true,\n  srcs: [\"libbt_hci.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/hci/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbt_main\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_main\",\n  edition: \"2018\",\n  rustlibs: [\"libbt_hal\",\"libbt_hci\",\"libtokio\",\"libgddi\",\"libbt_common\",\"libgrpcio\"],\n  multiple_variants: true,\n  srcs: [\"libbt_main.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/main/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt_shim_ffi\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"libbt_shim_ffi.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libbluetooth_rust_interop\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  header_libs: [\"libbt_callbacks_cxx_headers\"],\n  export_header_lib_headers: [\"libbt_callbacks_cxx_headers\"],\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  shared_libs: [\"libchrome\"],\n  whole_static_libs: [\"libbt_shim_ffi\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth_rust_interop.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/shim/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaudio-a2dp-hw-utils\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudio-a2dp-hw-utils.a\"],\n}\ncc_prebuilt_library {\n  name: \"audio.a2dp.default\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libosi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\"],\n  relative_install_path: \"hw\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"audio.a2dp.default.a\"],\n  },\n  shared: {\n    srcs: [\"audio.a2dp.default.so\"],\n  },\n}\n" >> prebuiltlibs/system/bt/audio_a2dp_hw/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-common\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libbt-protos-lite\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"libcrypto\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-common.a\"],\n}\n" >> prebuiltlibs/system/bt/common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-hci\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-hci.a\"],\n}\n" >> prebuiltlibs/system/bt/hci/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-sbc-decoder\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-sbc-decoder.a\"],\n}\n" >> prebuiltlibs/system/bt/embdrv/sbc/decoder/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-sbc-encoder\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-sbc-encoder.a\"],\n}\n" >> prebuiltlibs/system/bt/embdrv/sbc/encoder/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-stack\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libbt-hci\",\"libFraunhoferAAC\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\",\"libcrypto\"],\n  required: [\"libldacBT_enc\",\"libldacBT_abr\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-stack.a\"],\n}\n" >> prebuiltlibs/system/bt/stack/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-utils\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"libprocessgroup\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-utils.a\"],\n}\n" >> prebuiltlibs/system/bt/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbtcore\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbtcore.a\"],\n}\n" >> prebuiltlibs/system/bt/btcore/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbtdevice\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbtdevice.a\"],\n}\n" >> prebuiltlibs/system/bt/device/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbte\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"libflatbuffers-cpp\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbte.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libbluetooth\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"android.system.suspend.control-V1-ndk\",\"android.system.suspend@1.0\",\"libaaudio\",\"libfmq\"],\n      required: [\"libldacBT_enc\",\"libldacBT_abr\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  header_libs: [\"libbluetooth_headers\"],\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libbte\",\"libbt-sbc-decoder\",\"libbt-sbc-encoder\",\"libFraunhoferAAC\",\"libg722codec\",\"libudrv-uipc\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n    never: true,\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"android.hardware.bluetooth.a2dp@1.0\",\"android.hardware.bluetooth.audio@2.0\",\"android.hardware.bluetooth.audio@2.1\",\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libbinder_ndk\",\"libcrypto\",\"libflatbuffers-cpp\",\"liblog\",\"libprocessgroup\",\"libprotobuf-cpp-lite\",\"libtinyxml2\",\"libz\"],\n  export_header_lib_headers: [\"libbluetooth_headers\"],\n  logtags: [\"../EventLogTags.logtags\"],\n  whole_static_libs: [\"libbt-bta\",\"libbt-common\",\"libbtdevice\",\"libbtif\",\"libbt-hci\",\"libbt-stack\",\"libbt-utils\",\"libbtcore\",\"libosi\",\"libbt-protos-lite\"],\n  required: [\"bt_did.conf\",\"bt_stack.conf\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth.so\"],\n}\n" >> prebuiltlibs/system/bt/main/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libg722codec\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libg722codec.a\"],\n}\n" >> prebuiltlibs/system/bt/embdrv/g722/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libosi\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libbt-protos-lite\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libosi.a\"],\n}\n" >> prebuiltlibs/system/bt/osi/Android.bp
printf "cc_prebuilt_library {\n  name: \"audio.hearing_aid.default\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libosi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"liblog\"],\n  relative_install_path: \"hw\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"audio.hearing_aid.default.a\"],\n  },\n  shared: {\n    srcs: [\"audio.hearing_aid.default.so\"],\n  },\n}\n" >> prebuiltlibs/system/bt/audio_hearing_aid_hw/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"avrcp-target-service\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"lib-bt-packets\",\"libosi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"libchrome\"],\n  host_supported: true,\n  export_include_dirs: [\"./\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"avrcp-target-service.a\"],\n}\n" >> prebuiltlibs/system/bt/profile/avrcp/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-bta\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"avrcp-target-service\",\"lib-bt-packets\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-bta.a\"],\n}\n" >> prebuiltlibs/system/bt/bta/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-audio-hal-interface\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libfmq\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\",\"libosi\",\"libbt-common\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"android.hardware.bluetooth.audio@2.0\",\"android.hardware.bluetooth.audio@2.1\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-audio-hal-interface.a\"],\n}\n" >> prebuiltlibs/system/bt/audio_hal_interface/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbtif\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libaaudio\",\"libfmq\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\",\"android.hardware.bluetooth.a2dp@1.0\",\"android.hardware.bluetooth.audio@2.0\",\"android.hardware.bluetooth.audio@2.1\",\"libcrypto\",\"liblog\",\"libtinyxml2\",\"libz\"],\n  whole_static_libs: [\"avrcp-target-service\",\"lib-bt-packets\",\"libbt-audio-hal-interface\",\"libaudio-a2dp-hw-utils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbtif.a\"],\n}\n" >> prebuiltlibs/system/bt/btif/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libudrv-uipc\",\n  target: {\n    android: {\n      shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbluetooth-types\",\"libbt-platform-protos-lite\",\"libbluetooth_rust_interop\",\"liblog\",\"libcutils\",\"libbluetooth_gd\",\"libbt_shim_ffi\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libcutils\",\"libgrpc++\",\"libgrpc_wrap\",\"libhidlbase\",\"libstatslog\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libudrv-uipc.a\"],\n}\n" >> prebuiltlibs/system/bt/udrv/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-11
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-11.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/bootstat/bootstat/android_x86_64/bootstat \
out/soong/.intermediates/system/core/healthd/libhealthd_charger/android_x86_64_static/libhealthd_charger.a \
out/soong/.intermediates/system/core/healthd/libhealthd_charger_nops/android_recovery_x86_64_static/libhealthd_charger_nops.a \
out/soong/.intermediates/system/core/healthd/libhealthd_charger_nops/android_x86_64_static/libhealthd_charger_nops.a \
out/soong/.intermediates/system/core/healthd/charger/android_recovery_x86_64/charger \
out/soong/.intermediates/system/core/healthd/charger/android_x86_64/charger \
out/soong/.intermediates/system/core/fs_mgr/remount/android_x86_64/remount \
out/soong/.intermediates/system/core/set-verity-state/set-verity-state/android_x86_64/set-verity-state \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl \


mkdir -p prebuiltlibs/system/core/bootstat/bootstat/android_x86_64/ && mv out/soong/.intermediates/system/core/bootstat/bootstat/android_x86_64/bootstat prebuiltlibs/system/core/bootstat/bootstat/android_x86_64/bootstat
mkdir -p prebuiltlibs/system/core/healthd/libhealthd_charger/android_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libhealthd_charger/android_x86_64_static/libhealthd_charger.a prebuiltlibs/system/core/healthd/libhealthd_charger/android_x86_64_static/libhealthd_charger.a
mkdir -p prebuiltlibs/system/core/healthd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/healthd/ prebuiltlibs/system/core/healthd/
mkdir -p prebuiltlibs/system/core/healthd/libhealthd_charger_nops/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libhealthd_charger_nops/android_recovery_x86_64_static/libhealthd_charger_nops.a prebuiltlibs/system/core/healthd/libhealthd_charger_nops/android_recovery_x86_64_static/libhealthd_charger_nops.a
mkdir -p prebuiltlibs/system/core/healthd/libhealthd_charger_nops/android_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libhealthd_charger_nops/android_x86_64_static/libhealthd_charger_nops.a prebuiltlibs/system/core/healthd/libhealthd_charger_nops/android_x86_64_static/libhealthd_charger_nops.a
mkdir -p prebuiltlibs/system/core/healthd/charger/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/healthd/charger/android_recovery_x86_64/charger prebuiltlibs/system/core/healthd/charger/android_recovery_x86_64/charger
mkdir -p prebuiltlibs/system/core/healthd/charger/android_x86_64/ && mv out/soong/.intermediates/system/core/healthd/charger/android_x86_64/charger prebuiltlibs/system/core/healthd/charger/android_x86_64/charger
mkdir -p prebuiltlibs/system/core/fs_mgr/remount/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/remount/android_x86_64/remount prebuiltlibs/system/core/fs_mgr/remount/android_x86_64/remount
mkdir -p prebuiltlibs/system/core/set-verity-state/set-verity-state/android_x86_64/ && mv out/soong/.intermediates/system/core/set-verity-state/set-verity-state/android_x86_64/set-verity-state prebuiltlibs/system/core/set-verity-state/set-verity-state/android_x86_64/set-verity-state
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl prebuiltlibs/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl

printf "cc_prebuilt_binary {\n  name: \"bootstat\",\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libstatslog\"],\n  init_rc: [\"bootstat.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bootstat\"],\n}\n" >> prebuiltlibs/system/core/bootstat/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhealthd_charger\",\n  export_include_dirs: [\".\",\"include\"],\n  static_libs: [\"android.hardware.health@1.0-convert\",\"libcharger_sysprop\",\"libhealthd_draw\",\"libhealthloop\",\"libhealth2impl\",\"libminui\"],\n  shared_libs: [\"android.hardware.health@2.1\",\"libbase\",\"libcutils\",\"liblog\",\"libpng\",\"libsuspend\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthd_charger.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libhealthd_charger_nops\",\n  recovery_available: true,\n  static_libs: [\"libhealthloop\",\"libhealth2impl\"],\n  shared_libs: [\"android.hardware.health@2.1\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthd_charger_nops.a\"],\n}\ncc_prebuilt_binary {\n  name: \"charger\",\n  shared_libs: [\"android.hardware.health@2.0\",\"android.hardware.health@2.1\",\"libbase\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"libpng\"],\n  recovery_available: true,\n  target: {\n    recovery: {\n      exclude_shared_libs: [\"libpng\"],\n      exclude_static_libs: [\"libhealthd_draw\",\"libhealthd_charger\",\"libminui\",\"libsuspend\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"charger\"],\n}\n" >> prebuiltlibs/system/core/healthd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"remount\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbootloader_message\",\"libbase\",\"libbinder\",\"libcutils\",\"libcrypto\",\"libext4_utils\",\"libfec\",\"libfs_mgr_binder\",\"liblog\",\"liblp\",\"libselinux\"],\n  required: [\"clean_scratch_files\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"remount\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/Android.bp
printf "cc_prebuilt_binary {\n  name: \"set-verity-state\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libfec\",\"libfs_mgr_binder\",\"liblog\",\"libutils\"],\n  symlinks: [\"enable-verity\",\"disable-verity\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"set-verity-state\"],\n}\n" >> prebuiltlibs/system/core/set-verity-state/Android.bp
printf "cc_prebuilt_binary {\n  name: \"snapshotctl\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libbase\",\"libbinder\",\"libext2_uuid\",\"libext4_utils\",\"libfs_mgr_binder\",\"libhidlbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"snapshotctl\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-11
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-11.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/gsid/gsid/android_x86_64/gsid \


mkdir -p prebuiltlibs/system/gsid/gsid/android_x86_64/ && mv out/soong/.intermediates/system/gsid/gsid/android_x86_64/gsid prebuiltlibs/system/gsid/gsid/android_x86_64/gsid

printf "cc_prebuilt_binary {\n  name: \"gsid\",\n  required: [\"mke2fs\"],\n  init_rc: [\"gsid.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libcrypto\",\"liblog\"],\n  target: {\n    android: {\n      shared_libs: [\"libprocessgroup\",\"libvndksupport\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gsid\"],\n}\n" >> prebuiltlibs/system/gsid/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/gsid/ninja && rsync -ar out/soong/ninja/system/gsid/ prebuiltlibs/system/gsid/ninja/system_gsid-11
touch prebuiltlibs/system/gsid/ninja/.find-ignore
tar cfJ system_gsid-11.tar.xz -C prebuiltlibs/system/gsid/ .
ls -l system_gsid-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/netd/server/netd/android_x86_64_cfi/netd \


mkdir -p prebuiltlibs/system/netd/server/netd/android_x86_64_cfi/ && mv out/soong/.intermediates/system/netd/server/netd/android_x86_64_cfi/netd prebuiltlibs/system/netd/server/netd/android_x86_64_cfi/netd

printf "cc_prebuilt_binary {\n  name: \"netd\",\n  init_rc: [\"netd.rc\"],\n  required: [\"bpfloader\",\"clatd.o\",\"netd.o\"],\n  shared_libs: [\"android.system.net.netd@1.0\",\"android.system.net.netd@1.1\",\"libbase\",\"libbinder\",\"libbpf_android\",\"libcutils\",\"libdl\",\"libhidlbase\",\"liblog\",\"libmdnssd\",\"libnetd_resolv\",\"libnetdbpf\",\"libnetdutils\",\"libnetutils\",\"libpcap\",\"libprocessgroup\",\"libqtaguid\",\"libselinux\",\"libsysutils\",\"libutils\",\"netd_aidl_interface-V7-cpp\",\"netd_event_listener_interface-V1-cpp\",\"oemnetd_aidl_interface-cpp\"],\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"netd\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-11
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-11.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so \


mkdir -p prebuiltlibs/system/nfc/src/libnfc-nci/android_x86_64_shared/ && mv out/soong/.intermediates/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so prebuiltlibs/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so

printf "cc_prebuilt_library_shared {\n  arch: {\n    arm: {\n    },\n  },\n  name: \"libnfc-nci\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libhardware\",\"libz\",\"libchrome\",\"libbase\",\"libstatslog\",\"libhidlbase\",\"libutils\",\"android.hardware.nfc@1.0\",\"android.hardware.nfc@1.1\",\"android.hardware.nfc@1.2\"],\n  static_libs: [\"libnfcutils\"],\n  required: [\"libnfc-nci.conf-default\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n    integer_overflow: true,\n    scs: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnfc-nci.so\"],\n}\n" >> prebuiltlibs/system/nfc/src/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/nfc/ninja && rsync -ar out/soong/ninja/system/nfc/ prebuiltlibs/system/nfc/ninja/system_nfc-11
touch prebuiltlibs/system/nfc/ninja/.find-ignore
tar cfJ system_nfc-11.tar.xz -C prebuiltlibs/system/nfc/ .
ls -l system_nfc-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/keystore2/libkeystore2/android_x86_64_rlib_rlib-std/libkeystore2.rlib \
out/soong/.intermediates/system/security/keystore2/legacykeystore/liblegacykeystore-rust/android_x86_64_rlib_rlib-std/liblegacykeystore-rust.rlib \
out/soong/.intermediates/system/security/keystore2/keystore2/android_x86_64/keystore2 \


mkdir -p prebuiltlibs/system/security/keystore2/libkeystore2/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/libkeystore2/android_x86_64_rlib_rlib-std/libkeystore2.rlib prebuiltlibs/system/security/keystore2/libkeystore2/android_x86_64_rlib_rlib-std/libkeystore2.rlib
mkdir -p prebuiltlibs/system/security/keystore2/legacykeystore/liblegacykeystore-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/legacykeystore/liblegacykeystore-rust/android_x86_64_rlib_rlib-std/liblegacykeystore-rust.rlib prebuiltlibs/system/security/keystore2/legacykeystore/liblegacykeystore-rust/android_x86_64_rlib_rlib-std/liblegacykeystore-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/keystore2/android_x86_64/ && mv out/soong/.intermediates/system/security/keystore2/keystore2/android_x86_64/keystore2 prebuiltlibs/system/security/keystore2/keystore2/android_x86_64/keystore2

printf "rust_prebuilt_rlib {\n  name: \"libkeystore2\",\n  crate_name: \"keystore2\",\n  rustlibs: [\"android.hardware.security.keymint-V1-rust\",\"android.hardware.security.secureclock-V1-rust\",\"android.hardware.security.sharedsecret-V1-rust\",\"android.os.permissions_aidl-rust\",\"android.security.apc-rust\",\"android.security.authorization-rust\",\"android.security.compat-rust\",\"android.security.maintenance-rust\",\"android.security.metrics-rust\",\"android.security.remoteprovisioning-rust\",\"android.system.keystore2-V1-rust\",\"libanyhow\",\"libbinder_rs\",\"libcutils_bindgen\",\"libkeystore2_aaid-rust\",\"libkeystore2_apc_compat-rust\",\"libkeystore2_crypto_rust\",\"libkeystore2_km_compat\",\"libkeystore2_selinux\",\"libkeystore2_system_property-rust\",\"libkeystore2_vintf_rust\",\"liblazy_static\",\"liblibc\",\"liblibsqlite3_sys\",\"liblog_event_list\",\"liblog_rust\",\"librand\",\"librusqlite\",\"libthiserror\"],\n  shared_libs: [\"libcutils\"],\n  features: [\"watchdog\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2.rlib\"],\n}\ncc_prebuilt_binary {\n  name: \"keystore2\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"keystore2\"],\n}\n" >> prebuiltlibs/system/security/keystore2/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblegacykeystore-rust\",\n  crate_name: \"legacykeystore\",\n  rustlibs: [\"android.security.legacykeystore-rust\",\"libanyhow\",\"libbinder_rs\",\"libcutils_bindgen\",\"libkeystore2\",\"liblog_rust\",\"librusqlite\",\"libthiserror\"],\n  multiple_variants: true,\n  srcs: [\"liblegacykeystore-rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/legacykeystore/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-11
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-11.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/update_engine/libupdate_engine_boot_control/android_x86_64_static/libupdate_engine_boot_control.a \
out/soong/.intermediates/system/update_engine/libupdate_engine_boot_control/android_recovery_x86_64_static/libupdate_engine_boot_control.a \
out/soong/.intermediates/system/update_engine/libupdate_engine_android/android_x86_64_static/libupdate_engine_android.a \
out/soong/.intermediates/system/update_engine/update_engine/android_x86_64/update_engine \
out/soong/.intermediates/system/update_engine/update_engine_sideload/android_recovery_x86_64/update_engine_sideload \


mkdir -p prebuiltlibs/system/update_engine/libupdate_engine_boot_control/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libupdate_engine_boot_control/android_x86_64_static/libupdate_engine_boot_control.a prebuiltlibs/system/update_engine/libupdate_engine_boot_control/android_x86_64_static/libupdate_engine_boot_control.a
mkdir -p prebuiltlibs/system/update_engine/libupdate_engine_boot_control/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libupdate_engine_boot_control/android_recovery_x86_64_static/libupdate_engine_boot_control.a prebuiltlibs/system/update_engine/libupdate_engine_boot_control/android_recovery_x86_64_static/libupdate_engine_boot_control.a
mkdir -p prebuiltlibs/system/update_engine/libupdate_engine_android/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libupdate_engine_android/android_x86_64_static/libupdate_engine_android.a prebuiltlibs/system/update_engine/libupdate_engine_android/android_x86_64_static/libupdate_engine_android.a
mkdir -p prebuiltlibs/system/update_engine/libupdate_engine_android/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/update_engine/libupdate_engine_android/android_x86_64_static/gen/aidl prebuiltlibs/system/update_engine/libupdate_engine_android/android_x86_64_static/
mkdir -p prebuiltlibs/system/update_engine/update_engine/android_x86_64/ && mv out/soong/.intermediates/system/update_engine/update_engine/android_x86_64/update_engine prebuiltlibs/system/update_engine/update_engine/android_x86_64/update_engine
mkdir -p prebuiltlibs/system/update_engine/update_engine_sideload/android_recovery_x86_64/ && mv out/soong/.intermediates/system/update_engine/update_engine_sideload/android_recovery_x86_64/update_engine_sideload prebuiltlibs/system/update_engine/update_engine_sideload/android_recovery_x86_64/update_engine_sideload

printf "cc_prebuilt_library_static {\n  name: \"libupdate_engine_boot_control\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbootloader_message\",\"libhidlbase\",\"liblp\",\"libstatslog\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    recovery: {\n      static_libs: [\"libfs_mgr\",\"libsnapshot_nobinder\"],\n      exclude_static_libs: [\"libfs_mgr_binder\",\"libsnapshot\"],\n      exclude_shared_libs: [\"libstatslog\"],\n    },\n  },\n  static_libs: [\"libcutils\",\"libfs_mgr_binder\",\"libgsi\",\"libpayload_consumer\",\"libsnapshot\",\"libsnapshot_cow\",\"libz\",\"update_metadata-protos\",\"libxz\",\"libbz\",\"libbspatch\",\"libbrotli\",\"libc++fs\",\"libfec_rs\",\"libpuffpatch\",\"libverity_tree\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libcow_operation_convert\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libupdate_engine_boot_control.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libupdate_engine_android\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\",\"libbootloader_message\",\"libhidlbase\",\"liblp\",\"libstatslog\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"apex_aidl_interface-cpp\",\"libandroid_net\",\"libbinder\",\"libbinderwrapper\",\"libbrillo-binder\",\"libcurl\",\"libcutils\",\"libupdate_engine_stable-V1-cpp\",\"liblog\",\"libssl\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    recovery: {\n      static_libs: [\"libfs_mgr\",\"libsnapshot_nobinder\"],\n      exclude_static_libs: [\"libfs_mgr_binder\",\"libsnapshot\"],\n      exclude_shared_libs: [\"libstatslog\"],\n    },\n  },\n  static_libs: [\"update_metadata-protos\",\"libxz\",\"libbz\",\"libbspatch\",\"libbrotli\",\"libc++fs\",\"libfec_rs\",\"libpuffpatch\",\"libverity_tree\",\"libsnapshot_cow\",\"libz\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libcow_operation_convert\",\"libcutils\",\"libfs_mgr_binder\",\"libgsi\",\"libpayload_consumer\",\"libsnapshot\",\"libavb\",\"libavb_user\",\"gkiprops\",\"libupdate_engine_boot_control\",\"PlatformProperties\"],\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libupdate_engine_android.a\"],\n}\ncc_prebuilt_binary {\n  name: \"update_engine\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\",\"libbootloader_message\",\"libhidlbase\",\"liblp\",\"libstatslog\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"apex_aidl_interface-cpp\",\"libandroid_net\",\"libbinder\",\"libbinderwrapper\",\"libbrillo-binder\",\"libcurl\",\"libcutils\",\"libupdate_engine_stable-V1-cpp\",\"liblog\",\"libssl\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    recovery: {\n      static_libs: [\"libfs_mgr\",\"libsnapshot_nobinder\"],\n      exclude_static_libs: [\"libfs_mgr_binder\",\"libsnapshot\"],\n      exclude_shared_libs: [\"libstatslog\"],\n    },\n  },\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  required: [\"cacerts_google\",\"otacerts\"],\n  init_rc: [\"update_engine.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_engine\"],\n}\ncc_prebuilt_binary {\n  name: \"update_engine_sideload\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbootloader_message\",\"libhidlbase\",\"liblp\",\"libstatslog\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\",\"liblog\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    recovery: {\n      static_libs: [\"libfs_mgr\",\"libsnapshot_nobinder\"],\n      exclude_static_libs: [\"libfs_mgr_binder\",\"libsnapshot\"],\n      exclude_shared_libs: [\"libstatslog\",\"libprotobuf-cpp-lite\",\"libbrillo-stream\",\"libbrillo\",\"libchrome\"],\n    },\n  },\n  recovery: true,\n  required: [\"otacerts.recovery\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_engine_sideload\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/update_engine/ninja && rsync -ar out/soong/ninja/system/update_engine/ prebuiltlibs/system/update_engine/ninja/system_update_engine-11
touch prebuiltlibs/system/update_engine/ninja/.find-ignore
tar cfJ system_update_engine-11.tar.xz -C prebuiltlibs/system/update_engine/ .
ls -l system_update_engine-11.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'bootable/recovery/'
du -ah -d1 bootable/recovery/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'device/generic/vulkan-cereal/'
du -ah -d1 device/generic/vulkan-cereal/|sort -rh
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/aac/'
du -ah -d1 external/aac/|sort -rh
echo 'external/angle/'
du -ah -d1 external/angle/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/cros/system_api/'
du -ah -d1 external/cros/system_api/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/drm_hwcomposer/'
du -ah -d1 external/drm_hwcomposer/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libavc/'
du -ah -d1 external/libavc/|sort -rh
echo 'external/libchrome/'
du -ah -d1 external/libchrome/|sort -rh
echo 'external/libldac/'
du -ah -d1 external/libldac/|sort -rh
echo 'external/libmpeg2/'
du -ah -d1 external/libmpeg2/|sort -rh
echo 'external/mdnsresponder/'
du -ah -d1 external/mdnsresponder/|sort -rh
echo 'external/minigbm/'
du -ah -d1 external/minigbm/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/sonic/'
du -ah -d1 external/sonic/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/swiftshader/'
du -ah -d1 external/swiftshader/|sort -rh
echo 'external/vm_tools/p9/'
du -ah -d1 external/vm_tools/p9/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/hardware/interfaces/'
du -ah -d1 frameworks/hardware/interfaces/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/proto_logging/'
du -ah -d1 frameworks/proto_logging/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
echo 'hardware/google/camera/'
du -ah -d1 hardware/google/camera/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/apps/Gallery2/'
du -ah -d1 packages/apps/Gallery2/|sort -rh
echo 'packages/modules/Gki/'
du -ah -d1 packages/modules/Gki/|sort -rh
echo 'packages/modules/NeuralNetworks/'
du -ah -d1 packages/modules/NeuralNetworks/|sort -rh
echo 'packages/modules/Virtualization/'
du -ah -d1 packages/modules/Virtualization/|sort -rh
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
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/gsid/'
du -ah -d1 system/gsid/|sort -rh
echo 'system/hardware/interfaces/'
du -ah -d1 system/hardware/interfaces/|sort -rh
echo 'system/incremental_delivery/'
du -ah -d1 system/incremental_delivery/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/libhwbinder/'
du -ah -d1 system/libhwbinder/|sort -rh
echo 'system/libsysprop/'
du -ah -d1 system/libsysprop/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/nfc/'
du -ah -d1 system/nfc/|sort -rh
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
echo 'system/update_engine/'
du -ah -d1 system/update_engine/|sort -rh
echo 'prebuiltlibs/art/'
du -ah -d1 prebuiltlibs/art/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/bootable/recovery/'
du -ah -d1 prebuiltlibs/bootable/recovery/|sort -rh
echo 'prebuiltlibs/device/generic/goldfish-opengl/'
du -ah -d1 prebuiltlibs/device/generic/goldfish-opengl/|sort -rh
echo 'prebuiltlibs/device/generic/vulkan-cereal/'
du -ah -d1 prebuiltlibs/device/generic/vulkan-cereal/|sort -rh
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
echo 'prebuiltlibs/external/libchromeos-rs/'
du -ah -d1 prebuiltlibs/external/libchromeos-rs/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/grpcio/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/rusqlite/'
du -ah -d1 prebuiltlibs/external/rust/crates/rusqlite/|sort -rh
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
echo 'prebuiltlibs/external/skia/'
du -ah -d1 prebuiltlibs/external/skia/|sort -rh
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
echo 'prebuiltlibs/external/vulkan-headers/'
du -ah -d1 prebuiltlibs/external/vulkan-headers/|sort -rh
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
echo 'prebuiltlibs/packages/apps/Bluetooth/'
du -ah -d1 prebuiltlibs/packages/apps/Bluetooth/|sort -rh
echo 'prebuiltlibs/packages/apps/Gallery2/'
du -ah -d1 prebuiltlibs/packages/apps/Gallery2/|sort -rh
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
