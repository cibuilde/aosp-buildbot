export GIT_AOSP_URL="https://android.googlesource.com/"
export AOSP_PLATFORM_URL="${GIT_AOSP_URL}platform/"
export BRANCH="android12-gsi"

function clone_depth() {
  #set -x
  local project_path=$1
  local path_key=${project_path//\//_}
  local cache_file="$GITHUB_WORKSPACE/cache/${path_key}.tar.zst"
  local project_name=$project_path

  # Add check for additional arguments
  if [ $# -gt 1 ]; then
    local project_name=$2
  fi

  if [ -f "$cache_file" ]; then
    echo "Cache hit: Extracting $cache_file to $project_path"
    mkdir -p "$project_path"
    tar xf "$cache_file" -C "$project_path"
  else
    echo "Cache miss: Cloning $project_path"
    git clone --depth=1 ${GIT_AOSP_URL}$project_name $project_path -b ${BRANCH}
  fi
  #set +x
}

function clone_depth_platform() {
  #set -x
  local project_path=$1
  local path_key=${project_path//\//_}
  local cache_file="$GITHUB_WORKSPACE/cache/${path_key}.tar.zst"
  
  if [ -f "$cache_file" ]; then
    echo "Cache hit: Extracting $cache_file to $project_path"
    mkdir -p "$project_path"
    tar xf "$cache_file" -C "$project_path"
  else
    echo "Cache miss: Cloning $project_path"
    git clone --depth=1 ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
  fi
  #set +x
}

function sparse_setup() {
  prj_path=$1
  shift;
  git -C $prj_path sparse-checkout init --cone
  git -C $prj_path sparse-checkout add "$@"
}

function clone_sparse() {
  #set -x
  local project_path=$1
  local path_key=${project_path//\//_}
  local cache_file="$GITHUB_WORKSPACE/cache/${path_key}.tar.zst"
  
  if [ -f "$cache_file" ]; then
    echo "Cache hit: Extracting $cache_file to $project_path"
    mkdir -p "$project_path"
    tar xf "$cache_file" -C "$project_path"
  else
    echo "Cache miss: Cloning $project_path"
    git clone --filter=tree:0 --single-branch --no-tags --sparse ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
    sparse_setup "$@"
  fi
  #set +x
}

function clone_sparse_exclude() {
  #set -x
  local project_path=$1
  local path_key=${project_path//\//_}
  local cache_file="$GITHUB_WORKSPACE/cache/${path_key}.tar.zst"
  
  if [ -f "$cache_file" ]; then
    echo "Cache hit: Extracting $cache_file to $project_path"
    mkdir -p "$project_path"
    tar xf "$cache_file" -C "$project_path"
  else
    echo "Cache miss: Cloning $project_path"
    #set -x
    git clone --filter=tree:0 --single-branch --no-tags --sparse ${AOSP_PLATFORM_URL}$1 $1 -b ${BRANCH}
    prj_path=$1
    shift;
    git -C $prj_path sparse-checkout set --no-cone '/*'  "$@"
  fi
  #set +x
}

function clone_project() {
  #set -x
  local project_name=$1
  local project_path=$2
  local branch=$3
  local remote_name=origin

  local path_key=${project_path//\//_}
  local cache_file="$GITHUB_WORKSPACE/cache/${path_key}.tar.zst"

  if [ -f "$cache_file" ]; then
    echo "Cache hit: Extracting $cache_file to $project_path"
    mkdir -p "$project_path"
    tar xf "$cache_file" -C "$project_path"
  else
    echo "Cache miss: Cloning $project_path"
    shift 2
    mkdir -p ${project_path}
    git -C ${project_path} init
    git -C ${project_path} config --unset-all core.bare
    git -C ${project_path} config remote.${remote_name}.url "https://android.googlesource.com/${project_name}"
    git -C ${project_path} config remote.${remote_name}.fetch "+refs/heads/${branch}:refs/remotes/${remote_name}/${branch}"
    git -C ${project_path} config extensions.partialclone ${remote_name}
    git -C ${project_path} sparse-checkout set --no-cone '!/*' "$@"
    git -C ${project_path} fetch ${remote_name} --filter=tree:0 --depth=1 --no-tags --progress "+refs/heads/${branch}:refs/remotes/${remote_name}/${branch}"
    echo $(git -C ${project_path} rev-parse --verify "refs/remotes/${remote_name}/${branch}^0") > ${project_path}/.git/HEAD
    git -C ${project_path} read-tree --reset -u -v HEAD
    #git sparse-checkout reapply
  fi
}

function download_release() {
  filename=$1
  build_tag=$2
  curl -LJO --retry 5 https://github.com/cibuilde/aosp-buildbot/releases/download/${build_tag}/${filename}
}

function extract_tar() {
  filename=$1
  project_path=$2
  shift 2
  mkdir -p prebuiltlibs/${project_path} && tar xf ${filename} -C prebuiltlibs/${project_path} --exclude="ninja" "$@"
}

function clean_out_intermediates() {
  find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' -type d -exec rm -rf {} +
  if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
    find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
  fi
}
