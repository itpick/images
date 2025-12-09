{ pkgs, lib, ... }:

# TODO: Add tests for grafana-alloy-operator image
{
  name = "grafana-alloy-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-alloy-operator"
    exit 1
  '';
}
