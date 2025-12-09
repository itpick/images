{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-provider-azure image
{
  name = "secrets-store-csi-driver-provider-azure";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-provider-azure"
    exit 1
  '';
}
