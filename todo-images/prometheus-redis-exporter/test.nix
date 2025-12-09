{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-redis-exporter image
{
  name = "prometheus-redis-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-redis-exporter"
    exit 1
  '';
}
