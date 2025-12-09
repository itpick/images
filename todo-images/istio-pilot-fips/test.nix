{ pkgs, lib, ... }:

# TODO: Add tests for istio-pilot-fips image
{
  name = "istio-pilot-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for istio-pilot-fips"
    exit 1
  '';
}
