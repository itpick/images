{ pkgs, lib, ... }:

# TODO: Add tests for grafana-mimir image
{
  name = "grafana-mimir";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-mimir"
    exit 1
  '';
}
