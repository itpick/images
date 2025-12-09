{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-node-exporter-iamguarded-fips image
{
  name = "prometheus-node-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-node-exporter-iamguarded-fips"
    exit 1
  '';
}
