{ pkgs, lib, ... }:

# TODO: Add tests for cilium-envoy-fips image
{
  name = "cilium-envoy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-envoy-fips"
    exit 1
  '';
}
