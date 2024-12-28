set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/apex

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/com.android.sysprop.apex_sysprop_library^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_java^linux_glibc_x86_64/ .

echo "building com.android.sysprop.apex_java_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja com.android.sysprop.apex_java_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/com.android.sysprop.apex_java_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/apex/com.android.sysprop.apex_java_gen^.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/com.android.sysprop.apex_java_gen^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_apex.tar.zst --clobber

du -ah -d1 system_apex*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi

rm -rf aosp
