{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-postgres-exporter image
{
  name = "prometheus-postgres-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-postgres-exporter"
    exit 1
  '';
}
