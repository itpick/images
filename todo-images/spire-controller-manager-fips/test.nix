{ pkgs, lib, ... }:

# TODO: Add tests for spire-controller-manager-fips image
{
  name = "spire-controller-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-controller-manager-fips"
    exit 1
  '';
}
