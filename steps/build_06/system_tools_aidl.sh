set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building lazy_test_service_aidl-cpp-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja lazy_test_service_aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl/tests/lazy_test/lazy_test_service_aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/aidl/lazy_test_service_aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/tools/aidl/tests/lazy_test/lazy_test_service_aidl-cpp-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_tools_aidl.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
