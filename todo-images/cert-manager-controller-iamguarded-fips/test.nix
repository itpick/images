{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-controller-iamguarded-fips image
{
  name = "cert-manager-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-controller-iamguarded-fips"
    exit 1
  '';
}
