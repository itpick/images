{ pkgs, lib, ... }:

# TODO: Add tests for clickhouse-operator image
{
  name = "clickhouse-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clickhouse-operator"
    exit 1
  '';
}
