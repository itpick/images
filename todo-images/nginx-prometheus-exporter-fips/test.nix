{ pkgs, lib, ... }:

# TODO: Add tests for nginx-prometheus-exporter-fips image
{
  name = "nginx-prometheus-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-prometheus-exporter-fips"
    exit 1
  '';
}
