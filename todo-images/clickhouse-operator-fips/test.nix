{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-operator-fips image
{
  name = "clickhouse-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-operator-fips"
    exit 1
  '';
}
