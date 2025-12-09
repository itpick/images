{ pkgs, lib, ... }:

# TODO: Add tests for cilium-operator-generic-fips image
{
  name = "cilium-operator-generic-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-operator-generic-fips"
    exit 1
  '';
}
