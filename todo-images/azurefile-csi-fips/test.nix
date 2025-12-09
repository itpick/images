{ pkgs, lib, ... }:

# TODO: Add tests for azurefile-csi-fips image
{
  name = "azurefile-csi-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azurefile-csi-fips"
    exit 1
  '';
}
