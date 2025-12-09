{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-blackbox-exporter-iamguarded-fips image
{
  name = "prometheus-blackbox-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-blackbox-exporter-iamguarded-fips"
    exit 1
  '';
}
