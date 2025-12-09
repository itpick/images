{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-statsd-exporter image
{
  name = "prometheus-statsd-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-statsd-exporter"
    exit 1
  '';
}
