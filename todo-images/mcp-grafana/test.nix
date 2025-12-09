{ pkgs, lib, ... }:

# TODO: Add tests for mcp-grafana image
{
  name = "mcp-grafana";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mcp-grafana"
    exit 1
  '';
}
