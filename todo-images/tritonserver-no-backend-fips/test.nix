{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-no-backend-fips image
{
  name = "tritonserver-no-backend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-no-backend-fips"
    exit 1
  '';
}
