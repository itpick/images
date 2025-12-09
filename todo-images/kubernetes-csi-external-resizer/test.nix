{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-resizer image
{
  name = "kubernetes-csi-external-resizer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-resizer"
    exit 1
  '';
}
