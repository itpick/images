{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-ui-fips image
{
  name = "cilium-hubble-ui-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-ui-fips"
    exit 1
  '';
}
