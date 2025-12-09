{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pgbouncer-exporter-fips image
{
  name = "prometheus-pgbouncer-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pgbouncer-exporter-fips"
    exit 1
  '';
}
