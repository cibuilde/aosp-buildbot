set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/StatsD

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building statsd-aidl-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statsd-aidl-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/StatsD/statsd-aidl-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/aidl/statsd-aidl-ndk_platform-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 packages_modules_StatsD.tar.zst --clobber

du -ah -d1 packages_modules_StatsD*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi

rm -rf aosp
