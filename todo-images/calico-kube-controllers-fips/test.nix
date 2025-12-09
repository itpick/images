{ pkgs, lib, ... }:

# TODO: Add tests for calico-kube-controllers-fips image
{
  name = "calico-kube-controllers-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-kube-controllers-fips"
    exit 1
  '';
}
