{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-logstash-exporter-fips image
{
  name = "prometheus-logstash-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-logstash-exporter-fips"
    exit 1
  '';
}
