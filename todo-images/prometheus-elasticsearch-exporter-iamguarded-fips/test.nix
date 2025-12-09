{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-elasticsearch-exporter-iamguarded-fips image
{
  name = "prometheus-elasticsearch-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-elasticsearch-exporter-iamguarded-fips"
    exit 1
  '';
}
