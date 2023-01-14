export GIT_AOSP_URL="https://android.googlesource.com/"
export AOSP_PLATFORM_URL="${GIT_AOSP_URL}platform/"
export BRANCH="android-12.0.0_r1"

function clone_depth() {
  git clone --depth=1 ${GIT_AOSP_URL}$1 $1 -b ${BRANCH}
}

function clone_depth_platform() {
  git clone --depth=1 ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
}

function sparse_setup() {
  prj_path=$1
  shift;
  git -C $prj_path sparse-checkout init --cone
  git -C $prj_path sparse-checkout add "$@"
}

function clone_sparse() {
  set -x
  git clone --filter=tree:0 --single-branch --no-tags --sparse ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
  sparse_setup "$@"
}

function clone_sparse_exclude() {
  set -x
  git clone --filter=tree:0 --single-branch --no-tags --sparse ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
  prj_path=$1
  shift;
  git -C $prj_path sparse-checkout set --no-cone '/*'  "$@"
}

function download_release() {
  curl -LJO https://github.com/cibuilde/aosp-buildbot/releases/download/$3/$1.tar.xz
  mkdir -p aosp/prebuiltlibs/$2 && tar xf $1.tar.xz -C aosp/prebuiltlibs/$2
}
