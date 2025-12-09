{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-operator-metrics-exporter-fips image
{
  name = "clickhouse-operator-metrics-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-operator-metrics-exporter-fips"
    exit 1
  '';
}
