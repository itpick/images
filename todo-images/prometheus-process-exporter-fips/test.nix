{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-process-exporter-fips image
{
  name = "prometheus-process-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-process-exporter-fips"
    exit 1
  '';
}
