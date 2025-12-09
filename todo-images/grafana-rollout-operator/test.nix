{ pkgs, lib, ... }:

# TODO: Add tests for grafana-rollout-operator image
{
  name = "grafana-rollout-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-rollout-operator"
    exit 1
  '';
}
