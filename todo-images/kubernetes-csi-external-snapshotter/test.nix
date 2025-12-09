{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-snapshotter image
{
  name = "kubernetes-csi-external-snapshotter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-snapshotter"
    exit 1
  '';
}
