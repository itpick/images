{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-csi-driver image
{
  name = "cert-manager-csi-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-csi-driver"
    exit 1
  '';
}
