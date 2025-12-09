{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-acmesolver-iamguarded-fips image
{
  name = "cert-manager-acmesolver-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-acmesolver-iamguarded-fips"
    exit 1
  '';
}
