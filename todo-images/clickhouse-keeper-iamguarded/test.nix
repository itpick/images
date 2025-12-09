{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-keeper-iamguarded image
{
  name = "clickhouse-keeper-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-keeper-iamguarded"
    exit 1
  '';
}
