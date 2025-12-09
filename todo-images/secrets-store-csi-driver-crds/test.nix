{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-crds image
{
  name = "secrets-store-csi-driver-crds";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-crds"
    exit 1
  '';
}
