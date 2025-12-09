{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-driver-nfs image
{
  name = "kubernetes-csi-driver-nfs";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-driver-nfs"
    exit 1
  '';
}
