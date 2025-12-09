{ pkgs, lib, ... }:

# TODO: Add tests for envoy-fips image
{
  name = "envoy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-fips"
    exit 1
  '';
}
