{ pkgs, lib, ... }:

# TODO: Add tests for envoy-ratelimit-fips image
{
  name = "envoy-ratelimit-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-ratelimit-fips"
    exit 1
  '';
}
