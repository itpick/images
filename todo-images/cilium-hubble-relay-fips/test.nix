{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-relay-fips image
{
  name = "cilium-hubble-relay-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-relay-fips"
    exit 1
  '';
}
