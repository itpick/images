{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver image
{
  name = "secrets-store-csi-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver"
    exit 1
  '';
}
