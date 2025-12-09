{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-process-exporter image
{
  name = "prometheus-process-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-process-exporter"
    exit 1
  '';
}
