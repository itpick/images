{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-postgres-exporter-iamguarded image
{
  name = "prometheus-postgres-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-postgres-exporter-iamguarded"
    exit 1
  '';
}
