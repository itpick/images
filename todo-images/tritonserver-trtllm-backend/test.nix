{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-trtllm-backend image
{
  name = "tritonserver-trtllm-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-trtllm-backend"
    exit 1
  '';
}
