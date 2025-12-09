{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-provisioner image
{
  name = "kubernetes-csi-external-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-provisioner"
    exit 1
  '';
}
