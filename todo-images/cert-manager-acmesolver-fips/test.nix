{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-acmesolver-fips image
{
  name = "cert-manager-acmesolver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-acmesolver-fips"
    exit 1
  '';
}
