{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-snmp-exporter image
{
  name = "prometheus-snmp-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-snmp-exporter"
    exit 1
  '';
}
