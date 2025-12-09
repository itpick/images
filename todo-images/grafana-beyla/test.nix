{ pkgs, lib, ... }:

# TODO: Add tests for grafana-beyla image
{
  name = "grafana-beyla";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-beyla"
    exit 1
  '';
}
