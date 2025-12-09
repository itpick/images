{ pkgs, lib, ... }:

# TODO: Add tests for flannel-cni-plugin-fips image
{
  name = "flannel-cni-plugin-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flannel-cni-plugin-fips"
    exit 1
  '';
}
