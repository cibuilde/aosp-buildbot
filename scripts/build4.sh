source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a \
  

mkdir -p prebuiltlibs/external/libffi/libffi/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a prebuiltlibs/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a
mkdir -p prebuiltlibs/external/libffi/linux-arm
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-arm/ prebuiltlibs/external/libffi/linux-arm
mkdir -p prebuiltlibs/external/libffi/linux-arm64
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-arm64/ prebuiltlibs/external/libffi/linux-arm64
mkdir -p prebuiltlibs/external/libffi/linux-x86
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-x86/ prebuiltlibs/external/libffi/linux-x86
mkdir -p prebuiltlibs/external/libffi/linux-x86_64
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-x86_64/ prebuiltlibs/external/libffi/linux-x86_64
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/src prebuiltlibs/
rsync -ar out/soong/.intermediates/external/libffi/ffi_header/gen prebuiltlibs/external/libffi/

printf "cc_prebuilt_library {\n  name: \"libffi\",\n  host_supported: true,\n  vendor_available: true,\n  arch: {\n    arm: {\n      export_include_dirs: [\"linux-arm\"],\n    },\n    arm64: {\n      export_include_dirs: [\"linux-arm64\"],\n    },\n    x86: {\n      export_include_dirs: [\"linux-x86\"],\n    },\n    x86_64: {\n      export_include_dirs: [\"linux-x86_64\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libffi.a\"],\n}\n" >> prebuiltlibs/external/libffi/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libffi/ninja && rsync -ar out/soong/ninja/external/libffi/ prebuiltlibs/external/libffi/ninja/external_libffi-4
touch prebuiltlibs/external/libffi/ninja/.find-ignore
tar cfJ external_libffi-4.tar.xz -C prebuiltlibs/external/libffi/ .
ls -l external_libffi-4.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
