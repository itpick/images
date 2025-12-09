{ pkgs, lib, ... }:

# TODO: Add tests for azuredisk-csi-fips image
{
  name = "azuredisk-csi-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azuredisk-csi-fips"
    exit 1
  '';
}
