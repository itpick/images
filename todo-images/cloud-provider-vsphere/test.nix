{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-vsphere image
{
  name = "cloud-provider-vsphere";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-vsphere"
    exit 1
  '';
}
