{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-pytorch-backend-fips image
{
  name = "tritonserver-pytorch-backend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-pytorch-backend-fips"
    exit 1
  '';
}
