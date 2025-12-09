{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-blackbox-exporter-iamguarded image
{
  name = "prometheus-blackbox-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-blackbox-exporter-iamguarded"
    exit 1
  '';
}
