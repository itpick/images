{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-cainjector-fips image
{
  name = "cert-manager-cainjector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-cainjector-fips"
    exit 1
  '';
}
