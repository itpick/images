{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-fips image
{
  name = "clickhouse-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-fips"
    exit 1
  '';
}
