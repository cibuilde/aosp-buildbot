set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/grpc-grpc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/nanopb-c
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building census^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja census,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/census^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_64_static

echo "building census^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja census,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/census^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_x86_64_static

echo "building gpr_base^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gpr_base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/gpr_base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_64_static

echo "building gpr_base^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gpr_base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/gpr_base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_x86_64_static

echo "building libalts_frame_protector^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_frame_protector,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_frame_protector^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_frame_protector^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_frame_protector^android_x86_64_static

echo "building libalts_frame_protector^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_frame_protector,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_frame_protector^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_frame_protector^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_frame_protector^android_x86_x86_64_static

echo "building libalts_util^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_64_static

echo "building libalts_util^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_x86_64_static

echo "building libgrpc++_codegen_base_src^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_codegen_base_src,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static

echo "building libgrpc++_base^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_base^android_x86_64_static

echo "building libgrpc++_codegen_base_src^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_codegen_base_src,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static

echo "building libgrpc++_base^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_base^android_x86_x86_64_static

echo "building libgrpc_client_authority_filter^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_authority_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static

echo "building libgrpc_client_authority_filter^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_authority_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static

echo "building libgrpc_client_channel^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_channel,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static

echo "building libgrpc_client_channel^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_channel,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static

echo "building libgrpc_deadline_filter^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_deadline_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static

echo "building libgrpc_deadline_filter^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_deadline_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static

echo "building libgrpc_http_filters^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_http_filters,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static

echo "building libgrpc_http_filters^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_http_filters,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static

echo "building libgrpc_lb_policy_grpclb_secure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_grpclb_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static

echo "building libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_grpclb_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static

echo "building libgrpc_lb_policy_pick_first^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_pick_first,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static

echo "building libgrpc_lb_policy_pick_first^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_pick_first,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static

echo "building libgrpc_lb_policy_round_robin^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_round_robin,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static

echo "building libgrpc_lb_policy_round_robin^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_round_robin,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static

echo "building libgrpc_max_age_filter^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_max_age_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static

echo "building libgrpc_max_age_filter^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_max_age_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static

echo "building libgrpc_message_size_filter^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_message_size_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static

echo "building libgrpc_message_size_filter^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_message_size_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static

echo "building libgrpc_resolver_dns_ares^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_ares,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static

echo "building libgrpc_resolver_dns_ares^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_ares,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static

echo "building libgrpc_resolver_dns_native^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_native,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static

echo "building libgrpc_resolver_dns_native^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_native,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static

echo "building libgrpc_resolver_fake^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_fake,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static

echo "building libgrpc_resolver_fake^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_fake,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static

echo "building libgrpc_resolver_sockaddr^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_sockaddr,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static

echo "building libgrpc_resolver_sockaddr^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_sockaddr,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static

echo "building libgrpc_secure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_secure^android_x86_64_static

echo "building libgrpc_secure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_secure^android_x86_x86_64_static

echo "building libgrpc_server_backward_compatibility^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_server_backward_compatibility,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static

echo "building libgrpc_server_backward_compatibility^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_server_backward_compatibility,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static

echo "building libgrpc_trace^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_trace,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_trace^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_trace^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_trace^android_x86_64_static

echo "building libgrpc_trace^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_trace,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_trace^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_trace^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_trace^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_alpn^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_alpn,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static

echo "building libgrpc_transport_chttp2^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_64_static

echo "building libgrpc_transport_chttp2_alpn^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_alpn,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_connector^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_connector,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_connector,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_insecure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_insecure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_insecure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_secure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_server_insecure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_insecure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static

echo "building libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_insecure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_server_secure^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static

echo "building libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static

echo "building libgrpc_transport_inproc^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_inproc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static

echo "building libgrpc_transport_inproc^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_inproc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static

echo "building libgrpc_workaround_cronet_compression_filter^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_workaround_cronet_compression_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static

echo "building libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_workaround_cronet_compression_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static

echo "building libtsi^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi^android_x86_64_static

echo "building libtsi^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi^android_x86_x86_64_static

echo "building libtsi_interface^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi_interface,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi_interface^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_64_static

echo "building libtsi_interface^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi_interface,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_grpc-grpc.tar.zst --clobber

du -ah -d1 external_grpc-grpc*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_nanopb-c.tar.zst" ]; then
  echo "Compressing external/nanopb-c -> external_nanopb-c.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_nanopb-c.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/nanopb-c/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi

rm -rf aosp
