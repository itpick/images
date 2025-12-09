{ pkgs, lib, ... }:

# TODO: Add tests for kube-vip-fips image
{
  name = "kube-vip-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-vip-fips"
    exit 1
  '';
}
