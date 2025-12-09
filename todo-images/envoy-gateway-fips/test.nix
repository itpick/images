{ pkgs, lib, ... }:

# TODO: Add tests for envoy-gateway-fips image
{
  name = "envoy-gateway-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-gateway-fips"
    exit 1
  '';
}
