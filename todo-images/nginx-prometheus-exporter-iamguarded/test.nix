{ pkgs, lib, ... }:

# TODO: Add tests for nginx-prometheus-exporter-iamguarded image
{
  name = "nginx-prometheus-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-prometheus-exporter-iamguarded"
    exit 1
  '';
}
