{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-startupapicheck-fips image
{
  name = "cert-manager-startupapicheck-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-startupapicheck-fips"
    exit 1
  '';
}
