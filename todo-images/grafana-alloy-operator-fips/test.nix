{ pkgs, lib, ... }:

# TODO: Add tests for grafana-alloy-operator-fips image
{
  name = "grafana-alloy-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-alloy-operator-fips"
    exit 1
  '';
}
