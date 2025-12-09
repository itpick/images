{ pkgs, lib, ... }:

# TODO: Add tests for grafana-alloy image
{
  name = "grafana-alloy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-alloy"
    exit 1
  '';
}
