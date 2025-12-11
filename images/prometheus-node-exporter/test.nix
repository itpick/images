{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-node-exporter image
{
  name = "prometheus-node-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-node-exporter"
    exit 1
  '';
}
