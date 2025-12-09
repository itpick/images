{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-health-monitor image
{
  name = "kubernetes-csi-external-health-monitor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-health-monitor"
    exit 1
  '';
}
