{ pkgs, lib, ... }:

# TODO: Add tests for istio-install-cni-fips image
{
  name = "istio-install-cni-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for istio-install-cni-fips"
    exit 1
  '';
}
