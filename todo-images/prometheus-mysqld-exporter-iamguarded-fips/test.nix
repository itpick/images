{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-mysqld-exporter-iamguarded-fips image
{
  name = "prometheus-mysqld-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-mysqld-exporter-iamguarded-fips"
    exit 1
  '';
}
