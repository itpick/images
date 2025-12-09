{ pkgs, lib, ... }:

# TODO: Add tests for gatekeeper-crds-fips image
{
  name = "gatekeeper-crds-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gatekeeper-crds-fips"
    exit 1
  '';
}
