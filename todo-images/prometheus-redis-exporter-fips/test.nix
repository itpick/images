{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-redis-exporter-fips image
{
  name = "prometheus-redis-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-redis-exporter-fips"
    exit 1
  '';
}
