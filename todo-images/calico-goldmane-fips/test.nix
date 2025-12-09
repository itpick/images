{ pkgs, lib, ... }:

# TODO: Add tests for calico-goldmane-fips image
{
  name = "calico-goldmane-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-goldmane-fips"
    exit 1
  '';
}
