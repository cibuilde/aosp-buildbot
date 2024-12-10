set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform bionic
clone_depth_platform external/grpc-grpc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building census^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja census,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/census^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_64_static

echo "building census^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja census,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/census^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/census^android_x86_x86_64_static

echo "building gpr_base^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gpr_base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/gpr_base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_64_static

echo "building gpr_base^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja gpr_base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/gpr_base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/gpr_base^android_x86_x86_64_static

echo "building libalts_util^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_64_static

echo "building libalts_util^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libalts_util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libalts_util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libalts_util^android_x86_x86_64_static

echo "building libgrpc++_codegen_base_src^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_codegen_base_src,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_64_static

echo "building libgrpc++_codegen_base_src^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc++_codegen_base_src,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc++_codegen_base_src^android_x86_x86_64_static

echo "building libgrpc_client_authority_filter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_authority_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_64_static

echo "building libgrpc_client_authority_filter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_authority_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_authority_filter^android_x86_x86_64_static

echo "building libgrpc_client_channel^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_channel,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_64_static

echo "building libgrpc_client_channel^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_client_channel,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_client_channel^android_x86_x86_64_static

echo "building libgrpc_deadline_filter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_deadline_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_64_static

echo "building libgrpc_deadline_filter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_deadline_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_deadline_filter^android_x86_x86_64_static

echo "building libgrpc_http_filters^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_http_filters,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_64_static

echo "building libgrpc_http_filters^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_http_filters,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_http_filters^android_x86_x86_64_static

echo "building libgrpc_lb_policy_grpclb_secure^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_grpclb_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_64_static

echo "building libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_grpclb_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure^android_x86_x86_64_static

echo "building libgrpc_lb_policy_pick_first^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_pick_first,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_64_static

echo "building libgrpc_lb_policy_pick_first^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_pick_first,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_pick_first^android_x86_x86_64_static

echo "building libgrpc_lb_policy_round_robin^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_round_robin,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_64_static

echo "building libgrpc_lb_policy_round_robin^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_lb_policy_round_robin,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_lb_policy_round_robin^android_x86_x86_64_static

echo "building libgrpc_max_age_filter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_max_age_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_64_static

echo "building libgrpc_max_age_filter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_max_age_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_max_age_filter^android_x86_x86_64_static

echo "building libgrpc_message_size_filter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_message_size_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_64_static

echo "building libgrpc_message_size_filter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_message_size_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_message_size_filter^android_x86_x86_64_static

echo "building libgrpc_resolver_dns_ares^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_ares,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_64_static

echo "building libgrpc_resolver_dns_ares^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_ares,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_ares^android_x86_x86_64_static

echo "building libgrpc_resolver_dns_native^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_native,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_64_static

echo "building libgrpc_resolver_dns_native^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_dns_native,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_dns_native^android_x86_x86_64_static

echo "building libgrpc_resolver_fake^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_fake,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_64_static

echo "building libgrpc_resolver_fake^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_fake,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_fake^android_x86_x86_64_static

echo "building libgrpc_resolver_sockaddr^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_sockaddr,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_64_static

echo "building libgrpc_resolver_sockaddr^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_resolver_sockaddr,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_resolver_sockaddr^android_x86_x86_64_static

echo "building libgrpc_server_backward_compatibility^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_server_backward_compatibility,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_64_static

echo "building libgrpc_server_backward_compatibility^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_server_backward_compatibility,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_server_backward_compatibility^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_alpn^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_alpn,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_64_static

echo "building libgrpc_transport_chttp2_alpn^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_alpn,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_alpn^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_connector^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_connector,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_connector,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_connector^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_insecure^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_insecure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_insecure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_client_secure^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_64_static

echo "building libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_client_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_client_secure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_server_insecure^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_insecure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_64_static

echo "building libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_insecure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure^android_x86_x86_64_static

echo "building libgrpc_transport_chttp2_server_secure^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_secure,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_64_static

echo "building libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_chttp2_server_secure,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_chttp2_server_secure^android_x86_x86_64_static

echo "building libgrpc_transport_inproc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_inproc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_64_static

echo "building libgrpc_transport_inproc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_transport_inproc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_transport_inproc^android_x86_x86_64_static

echo "building libgrpc_workaround_cronet_compression_filter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_workaround_cronet_compression_filter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_64_static

echo "building libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libgrpc_workaround_cronet_compression_filter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter^android_x86_x86_64_static

echo "building libtsi_interface^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi_interface,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi_interface^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_64_static

echo "building libtsi_interface^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libtsi_interface,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/libtsi_interface^android_x86_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_grpc-grpc.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.xz -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp