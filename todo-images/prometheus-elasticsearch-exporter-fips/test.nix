{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-elasticsearch-exporter-fips image
{
  name = "prometheus-elasticsearch-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-elasticsearch-exporter-fips"
    exit 1
  '';
}
