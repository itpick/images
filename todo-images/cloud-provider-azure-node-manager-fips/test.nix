{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-azure-node-manager-fips image
{
  name = "cloud-provider-azure-node-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-azure-node-manager-fips"
    exit 1
  '';
}
