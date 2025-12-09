{ pkgs, lib, ... }:

# TODO: Add tests for rancher-hardened-kubernetes-compat-fips image
{
  name = "rancher-hardened-kubernetes-compat-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-hardened-kubernetes-compat-fips"
    exit 1
  '';
}
