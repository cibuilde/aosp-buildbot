set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse cts libs/json
clone_depth_platform external/boringssl
clone_depth_platform external/expat
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/python/cpython2
clone_depth_platform external/sqlite
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building py2-c-module-_bisect^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_bisect,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_bisect^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_bisect^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_bisect^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_cn^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_cn,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_cn^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_cn^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_cn^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_hk^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_hk,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_hk^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_hk^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_hk^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_iso2022^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_iso2022,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_iso2022^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_iso2022^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_iso2022^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_jp^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_jp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_jp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_jp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_jp^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_kr^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_kr,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_kr^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_kr^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_kr^linux_glibc_x86_64_static

echo "building py2-c-module-_codecs_tw^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_codecs_tw,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_tw^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_codecs_tw^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_codecs_tw^linux_glibc_x86_64_static

echo "building py2-c-module-_collections^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_collections,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_collections^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_collections^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_collections^linux_glibc_x86_64_static

echo "building py2-c-module-_csv^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_csv,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_csv^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_csv^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_csv^linux_glibc_x86_64_static

echo "building py2-c-module-_ctypes^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_ctypes,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ctypes^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_ctypes^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ctypes^linux_glibc_x86_64_static

echo "building py2-c-module-_ctypes_test^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_ctypes_test,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ctypes_test^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_ctypes_test^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ctypes_test^linux_glibc_x86_64_static

echo "building py2-c-module-_functools^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_functools,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_functools^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_functools^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_functools^linux_glibc_x86_64_static

echo "building py2-c-module-_heapq^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_heapq,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_heapq^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_heapq^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_heapq^linux_glibc_x86_64_static

echo "building py2-c-module-_hotshot^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_hotshot,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_hotshot^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_hotshot^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_hotshot^linux_glibc_x86_64_static

echo "building py2-c-module-_io^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_io,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_io^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_io^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_io^linux_glibc_x86_64_static

echo "building py2-c-module-_json^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_json,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_json^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_json^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_json^linux_glibc_x86_64_static

echo "building py2-c-module-_lsprof^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_lsprof,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_lsprof^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_lsprof^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_lsprof^linux_glibc_x86_64_static

echo "building py2-c-module-_md5^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_md5,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_md5^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_md5^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_md5^linux_glibc_x86_64_static

echo "building py2-c-module-_multibytecodec^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_multibytecodec,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_multibytecodec^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_multibytecodec^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_multibytecodec^linux_glibc_x86_64_static

echo "building py2-c-module-_multiprocessing^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_multiprocessing,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_multiprocessing^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_multiprocessing^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_multiprocessing^linux_glibc_x86_64_static

echo "building py2-c-module-_random^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_random,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_random^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_random^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_random^linux_glibc_x86_64_static

echo "building py2-c-module-_sha256^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_sha256,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha256^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_sha256^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha256^linux_glibc_x86_64_static

echo "building py2-c-module-_sha512^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_sha512,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha512^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_sha512^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha512^linux_glibc_x86_64_static

echo "building py2-c-module-_sha^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_sha,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_sha^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sha^linux_glibc_x86_64_static

echo "building py2-c-module-_socket^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_socket,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_socket^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_socket^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_socket^linux_glibc_x86_64_static

echo "building py2-c-module-_sqlite3^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_sqlite3,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sqlite3^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_sqlite3^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_sqlite3^linux_glibc_x86_64_static

echo "building py2-c-module-_ssl^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_ssl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ssl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_ssl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_ssl^linux_glibc_x86_64_static

echo "building py2-c-module-_struct^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_struct,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_struct^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_struct^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_struct^linux_glibc_x86_64_static

echo "building py2-c-module-_testcapi^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-_testcapi,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_testcapi^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-_testcapi^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-_testcapi^linux_glibc_x86_64_static

echo "building py2-c-module-array^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-array,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-array^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-array^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-array^linux_glibc_x86_64_static

echo "building py2-c-module-audioop^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-audioop,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-audioop^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-audioop^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-audioop^linux_glibc_x86_64_static

echo "building py2-c-module-binascii^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-binascii,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-binascii^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-binascii^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-binascii^linux_glibc_x86_64_static

echo "building py2-c-module-cPickle^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-cPickle,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cPickle^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-cPickle^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cPickle^linux_glibc_x86_64_static

echo "building py2-c-module-cStringIO^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-cStringIO,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cStringIO^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-cStringIO^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cStringIO^linux_glibc_x86_64_static

echo "building py2-c-module-cmath^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-cmath,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cmath^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-cmath^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-cmath^linux_glibc_x86_64_static

echo "building py2-c-module-datetime^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-datetime,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-datetime^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-datetime^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-datetime^linux_glibc_x86_64_static

echo "building py2-c-module-fcntl^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-fcntl,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-fcntl^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-fcntl^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-fcntl^linux_glibc_x86_64_static

echo "building py2-c-module-future_builtins^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-future_builtins,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-future_builtins^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-future_builtins^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-future_builtins^linux_glibc_x86_64_static

echo "building py2-c-module-grp^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-grp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-grp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-grp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-grp^linux_glibc_x86_64_static

echo "building py2-c-module-itertools^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-itertools,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-itertools^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-itertools^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-itertools^linux_glibc_x86_64_static

echo "building py2-c-module-math^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-math,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-math^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-math^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-math^linux_glibc_x86_64_static

echo "building py2-c-module-mmap^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-mmap,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-mmap^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-mmap^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-mmap^linux_glibc_x86_64_static

echo "building py2-c-module-operator^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-operator,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-operator^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-operator^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-operator^linux_glibc_x86_64_static

echo "building py2-c-module-parser^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-parser,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-parser^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-parser^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-parser^linux_glibc_x86_64_static

echo "building py2-c-module-pyexpat^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-pyexpat,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-pyexpat^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-pyexpat^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-pyexpat^linux_glibc_x86_64_static

echo "building py2-c-module-resource^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-resource,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-resource^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-resource^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-resource^linux_glibc_x86_64_static

echo "building py2-c-module-select^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-select,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-select^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-select^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-select^linux_glibc_x86_64_static

echo "building py2-c-module-strop^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-strop,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-strop^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-strop^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-strop^linux_glibc_x86_64_static

echo "building py2-c-module-syslog^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-syslog,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-syslog^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-syslog^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-syslog^linux_glibc_x86_64_static

echo "building py2-c-module-termios^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-termios,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-termios^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-termios^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-termios^linux_glibc_x86_64_static

echo "building py2-c-module-time^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-time,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-time^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-time^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-time^linux_glibc_x86_64_static

echo "building py2-c-module-unicodedata^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-unicodedata,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-unicodedata^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-unicodedata^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-unicodedata^linux_glibc_x86_64_static

echo "building py2-c-module-xxsubtype^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-xxsubtype,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-xxsubtype^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-xxsubtype^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-xxsubtype^linux_glibc_x86_64_static

echo "building py2-c-module-zlib^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-c-module-zlib,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-zlib^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-c-module-zlib^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-c-module-zlib^linux_glibc_x86_64_static

echo "building py2-interp-object^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-interp-object,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-object^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-interp-object^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-object^linux_glibc_x86_64_static

echo "building py2-interp-parser^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-interp-parser,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-parser^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-interp-parser^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-parser^linux_glibc_x86_64_static

echo "building py2-interp-python^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja py2-interp-python,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-python^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/python/cpython2/py2-interp-python^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-interp-python^linux_glibc_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.zst -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_expat.tar.zst -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sqlite.tar.zst" ]; then
  echo "Compressing external/sqlite -> external_sqlite.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/aosp/external/sqlite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
