{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse image
{
  name = "clickhouse";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse"
    exit 1
  '';
}
