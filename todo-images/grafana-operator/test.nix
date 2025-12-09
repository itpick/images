{ pkgs, lib, ... }:

# TODO: Add tests for grafana-operator image
{
  name = "grafana-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-operator"
    exit 1
  '';
}
