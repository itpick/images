{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-provider-aws image
{
  name = "secrets-store-csi-driver-provider-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-provider-aws"
    exit 1
  '';
}
