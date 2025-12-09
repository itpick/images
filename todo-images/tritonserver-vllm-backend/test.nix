{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-vllm-backend image
{
  name = "tritonserver-vllm-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-vllm-backend"
    exit 1
  '';
}
