{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-redis-exporter-iamguarded-fips image
{
  name = "prometheus-redis-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-redis-exporter-iamguarded-fips"
    exit 1
  '';
}
