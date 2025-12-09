{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-cloudwatch-exporter-fips image
{
  name = "prometheus-cloudwatch-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-cloudwatch-exporter-fips"
    exit 1
  '';
}
