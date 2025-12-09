{ pkgs, lib, ... }:

# TODO: Add tests for vc-controller-manager-fips image
{
  name = "vc-controller-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-controller-manager-fips"
    exit 1
  '';
}
