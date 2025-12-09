{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-mongodb-exporter-fips image
{
  name = "prometheus-mongodb-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-mongodb-exporter-fips"
    exit 1
  '';
}
