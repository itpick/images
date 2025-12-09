{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-prometheus-exporter-fips image
{
  name = "neuvector-prometheus-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-prometheus-exporter-fips"
    exit 1
  '';
}
