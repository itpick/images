{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-beat-exporter-fips image
{
  name = "prometheus-beat-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-beat-exporter-fips"
    exit 1
  '';
}
