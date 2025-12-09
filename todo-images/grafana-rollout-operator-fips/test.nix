{ pkgs, lib, ... }:

# TODO: Add tests for grafana-rollout-operator-fips image
{
  name = "grafana-rollout-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-rollout-operator-fips"
    exit 1
  '';
}
