{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-cloudwatch-exporter image
{
  name = "prometheus-cloudwatch-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-cloudwatch-exporter"
    exit 1
  '';
}
