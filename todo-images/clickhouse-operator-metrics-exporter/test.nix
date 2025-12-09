{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-operator-metrics-exporter image
{
  name = "clickhouse-operator-metrics-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-operator-metrics-exporter"
    exit 1
  '';
}
