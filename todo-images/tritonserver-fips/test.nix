{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-fips image
{
  name = "tritonserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-fips"
    exit 1
  '';
}
