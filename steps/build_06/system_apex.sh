set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/apex

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building apex_aidl_interface-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja apex_aidl_interface-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex_aidl_interface-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/apex/apex_aidl_interface-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex_aidl_interface-cpp-source^

echo "building apex_aidl_interface-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja apex_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/apex/apex_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex_aidl_interface-java-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_apex.tar.zst --clobber

du -ah -d1 system_apex*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi

rm -rf aosp
