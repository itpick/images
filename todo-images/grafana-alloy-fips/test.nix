{ pkgs, lib, ... }:

# TODO: Add tests for grafana-alloy-fips image
{
  name = "grafana-alloy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-alloy-fips"
    exit 1
  '';
}
