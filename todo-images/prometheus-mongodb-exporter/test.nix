{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-mongodb-exporter image
{
  name = "prometheus-mongodb-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-mongodb-exporter"
    exit 1
  '';
}
