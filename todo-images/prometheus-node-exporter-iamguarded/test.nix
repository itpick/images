{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-node-exporter-iamguarded image
{
  name = "prometheus-node-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-node-exporter-iamguarded"
    exit 1
  '';
}
