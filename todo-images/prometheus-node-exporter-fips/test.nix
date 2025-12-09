{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-node-exporter-fips image
{
  name = "prometheus-node-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-node-exporter-fips"
    exit 1
  '';
}
