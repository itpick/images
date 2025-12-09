{ pkgs, lib, ... }:

# TODO: Add tests for calico-typha-fips image
{
  name = "calico-typha-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-typha-fips"
    exit 1
  '';
}
