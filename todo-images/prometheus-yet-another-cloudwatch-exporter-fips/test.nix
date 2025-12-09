{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-yet-another-cloudwatch-exporter-fips image
{
  name = "prometheus-yet-another-cloudwatch-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-yet-another-cloudwatch-exporter-fips"
    exit 1
  '';
}
