{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-elasticsearch-exporter-iamguarded image
{
  name = "prometheus-elasticsearch-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-elasticsearch-exporter-iamguarded"
    exit 1
  '';
}
