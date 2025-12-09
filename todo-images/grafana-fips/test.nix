{ pkgs, lib, ... }:

# TODO: Add tests for grafana-fips image
{
  name = "grafana-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-fips"
    exit 1
  '';
}
