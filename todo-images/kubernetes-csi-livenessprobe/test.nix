{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-livenessprobe image
{
  name = "kubernetes-csi-livenessprobe";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-livenessprobe"
    exit 1
  '';
}
