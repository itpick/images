{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-cmctl-fips image
{
  name = "cert-manager-cmctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-cmctl-fips"
    exit 1
  '';
}
