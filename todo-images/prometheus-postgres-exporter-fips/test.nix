{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-postgres-exporter-fips image
{
  name = "prometheus-postgres-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-postgres-exporter-fips"
    exit 1
  '';
}
