{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-redis-exporter-iamguarded image
{
  name = "prometheus-redis-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-redis-exporter-iamguarded"
    exit 1
  '';
}
