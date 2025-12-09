{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-statsd-exporter-fips image
{
  name = "prometheus-statsd-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-statsd-exporter-fips"
    exit 1
  '';
}
