{ pkgs, lib, ... }:

# TODO: Add tests for azuredisk-csi image
{
  name = "azuredisk-csi";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azuredisk-csi"
    exit 1
  '';
}
