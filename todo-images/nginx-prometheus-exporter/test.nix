{ pkgs, lib, ... }:

# TODO: Add tests for nginx-prometheus-exporter image
{
  name = "nginx-prometheus-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-prometheus-exporter"
    exit 1
  '';
}
