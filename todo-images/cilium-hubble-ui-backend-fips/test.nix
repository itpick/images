{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-ui-backend-fips image
{
  name = "cilium-hubble-ui-backend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-ui-backend-fips"
    exit 1
  '';
}
