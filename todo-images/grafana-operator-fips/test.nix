{ pkgs, lib, ... }:

# TODO: Add tests for grafana-operator-fips image
{
  name = "grafana-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-operator-fips"
    exit 1
  '';
}
