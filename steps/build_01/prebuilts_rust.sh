
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

echo "Preparing for prebuilts/rust"

clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"


echo "building libbacktrace_rs.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_rs.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_rs.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_rs.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libcompiler_builtins.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcompiler_builtins.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcompiler_builtins.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcompiler_builtins.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building liblibc.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblibc.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building liblibc.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblibc.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building liblibc.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblibc.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building liballoc.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liballoc.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building liballoc.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liballoc.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building liballoc.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liballoc.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libcfg_if.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcfg_if.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcfg_if.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libcfg_if.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcfg_if.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libpanic_abort.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpanic_abort.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpanic_abort.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libpanic_abort.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpanic_abort.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libunwind.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwind.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libunwind.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwind.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libunwind.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwind.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libhashbrown.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libhashbrown.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libhashbrown.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libhashbrown.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libhashbrown.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libstd^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstd,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib/addition_copy_files.output

echo "building libstd^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstd,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libstd^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstd,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libstd^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libterm^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libterm,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib/addition_copy_files.output

echo "building libterm^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libterm,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libterm^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libterm,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libterm^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libgetopts^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgetopts,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib/addition_copy_files.output

echo "building libgetopts^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgetopts,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libgetopts^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgetopts,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libgetopts^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libunicode_width.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunicode_width.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunicode_width.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libunicode_width.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libunicode_width.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libtest^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtest,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib/addition_copy_files.output

echo "building libtest^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtest,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libtest^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtest,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libtest^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libprofiler_builtins.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofiler_builtins.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofiler_builtins.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofiler_builtins.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libcore.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libcore.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libcore.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building libbacktrace_sys.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_sys.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_sys.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace_sys.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output

echo "building librustc_demangle.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librustc_demangle.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/addition_copy_files.output

echo "building librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librustc_demangle.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000 $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000/addition_copy_files.output

echo "building librustc_demangle.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librustc_demangle.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib.output $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_rust.tar.zst --clobber

du -ah -d1 prebuilts_rust*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
