{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pgbouncer-exporter image
{
  name = "prometheus-pgbouncer-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pgbouncer-exporter"
    exit 1
  '';
}
