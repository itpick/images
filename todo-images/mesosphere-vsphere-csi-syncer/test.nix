{ pkgs, lib, ... }:

# TODO: Add tests for mesosphere-vsphere-csi-syncer image
{
  name = "mesosphere-vsphere-csi-syncer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mesosphere-vsphere-csi-syncer"
    exit 1
  '';
}
