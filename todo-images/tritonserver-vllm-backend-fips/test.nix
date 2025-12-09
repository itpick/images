{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-vllm-backend-fips image
{
  name = "tritonserver-vllm-backend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-vllm-backend-fips"
    exit 1
  '';
}
