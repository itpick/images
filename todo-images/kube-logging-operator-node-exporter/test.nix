{ pkgs, lib, ... }:

# TODO: Add tests for kube-logging-operator-node-exporter image
{
  name = "kube-logging-operator-node-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-logging-operator-node-exporter"
    exit 1
  '';
}
