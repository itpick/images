{ pkgs, lib, ... }:

# TODO: Add tests for nginx-prometheus-exporter-iamguarded-fips image
{
  name = "nginx-prometheus-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-prometheus-exporter-iamguarded-fips"
    exit 1
  '';
}
