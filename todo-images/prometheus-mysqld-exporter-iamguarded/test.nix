{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-mysqld-exporter-iamguarded image
{
  name = "prometheus-mysqld-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-mysqld-exporter-iamguarded"
    exit 1
  '';
}
