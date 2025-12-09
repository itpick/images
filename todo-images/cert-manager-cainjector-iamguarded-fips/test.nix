{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-cainjector-iamguarded-fips image
{
  name = "cert-manager-cainjector-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-cainjector-iamguarded-fips"
    exit 1
  '';
}
