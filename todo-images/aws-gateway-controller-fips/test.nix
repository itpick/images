{ pkgs, lib, ... }:

# TODO: Add tests for aws-gateway-controller-fips image
{
  name = "aws-gateway-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-gateway-controller-fips"
    exit 1
  '';
}
