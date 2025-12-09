{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-azure-node-manager image
{
  name = "cloud-provider-azure-node-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-azure-node-manager"
    exit 1
  '';
}
