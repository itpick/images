{ pkgs, lib, ... }:

# TODO: Add tests for valkey-sentinel-iamguarded-fips image
{
  name = "valkey-sentinel-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for valkey-sentinel-iamguarded-fips"
    exit 1
  '';
}
