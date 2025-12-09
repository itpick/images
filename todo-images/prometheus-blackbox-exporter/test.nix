{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-blackbox-exporter image
{
  name = "prometheus-blackbox-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-blackbox-exporter"
    exit 1
  '';
}
