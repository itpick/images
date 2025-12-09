{ pkgs, lib, ... }:

# TODO: Add tests for envoy-iamguarded-fips image
{
  name = "envoy-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-iamguarded-fips"
    exit 1
  '';
}
