{ pkgs, lib, ... }:

# TODO: Add tests for multus-cni-fips image
{
  name = "multus-cni-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for multus-cni-fips"
    exit 1
  '';
}
