{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-controller-fips image
{
  name = "cert-manager-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-controller-fips"
    exit 1
  '';
}
