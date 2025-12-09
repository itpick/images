{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-iamguarded image
{
  name = "clickhouse-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-iamguarded"
    exit 1
  '';
}
