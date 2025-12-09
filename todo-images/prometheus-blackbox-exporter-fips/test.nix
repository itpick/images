{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-blackbox-exporter-fips image
{
  name = "prometheus-blackbox-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-blackbox-exporter-fips"
    exit 1
  '';
}
