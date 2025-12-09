{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-provider-gcp image
{
  name = "secrets-store-csi-driver-provider-gcp";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-provider-gcp"
    exit 1
  '';
}
