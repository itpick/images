{ pkgs, lib, ... }:

# TODO: Add tests for k8s_gateway-fips image
{
  name = "k8s_gateway-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s_gateway-fips"
    exit 1
  '';
}
