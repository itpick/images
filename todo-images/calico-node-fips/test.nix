{ pkgs, lib, ... }:

# TODO: Add tests for calico-node-fips image
{
  name = "calico-node-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-node-fips"
    exit 1
  '';
}
