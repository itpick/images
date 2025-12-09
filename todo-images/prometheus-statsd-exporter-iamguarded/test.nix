{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-statsd-exporter-iamguarded image
{
  name = "prometheus-statsd-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-statsd-exporter-iamguarded"
    exit 1
  '';
}
