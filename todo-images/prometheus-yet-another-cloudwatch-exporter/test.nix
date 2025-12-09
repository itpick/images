{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-yet-another-cloudwatch-exporter image
{
  name = "prometheus-yet-another-cloudwatch-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-yet-another-cloudwatch-exporter"
    exit 1
  '';
}
