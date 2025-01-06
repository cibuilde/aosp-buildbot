
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

echo "Preparing for packages/apps/DocumentsUI"

clone_depth_platform external/libcxx
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/proto_logging
clone_depth_platform packages/apps/DocumentsUI
clone_depth_platform system/libbase
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .

echo "building statslog-docsui-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-docsui-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/DocumentsUI/statslog-docsui-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/apps/DocumentsUI/statslog-docsui-java-gen^.output . $GITHUB_WORKSPACE/artifacts/packages/apps/DocumentsUI/statslog-docsui-java-gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/packages/apps/DocumentsUI/statslog-docsui-java-gen^.output $GITHUB_WORKSPACE/artifacts/packages/apps/DocumentsUI/statslog-docsui-java-gen^ $GITHUB_WORKSPACE/artifacts/packages/apps/DocumentsUI/statslog-docsui-java-gen^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_apps_DocumentsUI.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/apps/DocumentsUI/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 packages_apps_DocumentsUI.tar.zst --clobber

du -ah -d1 packages_apps_DocumentsUI*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_apps_DocumentsUI.tar.zst" ]; then
  echo "Compressing packages/apps/DocumentsUI -> packages_apps_DocumentsUI.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_apps_DocumentsUI.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/apps/DocumentsUI/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
