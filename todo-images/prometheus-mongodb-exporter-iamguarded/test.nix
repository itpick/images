{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-mongodb-exporter-iamguarded image
{
  name = "prometheus-mongodb-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-mongodb-exporter-iamguarded"
    exit 1
  '';
}
