{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-attacher image
{
  name = "kubernetes-csi-external-attacher";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-attacher"
    exit 1
  '';
}
