{ pkgs, lib, ... }:

# TODO: Add tests for calico-csi-fips image
{
  name = "calico-csi-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-csi-fips"
    exit 1
  '';
}
