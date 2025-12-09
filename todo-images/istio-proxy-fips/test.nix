{ pkgs, lib, ... }:

# TODO: Add tests for istio-proxy-fips image
{
  name = "istio-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for istio-proxy-fips"
    exit 1
  '';
}
