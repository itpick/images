{ pkgs, lib, ... }:

# TODO: Add tests for calico-cni-fips image
{
  name = "calico-cni-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-cni-fips"
    exit 1
  '';
}
