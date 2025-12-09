{ pkgs, lib, ... }:

# TODO: Add tests for grafana-mimir-fips image
{
  name = "grafana-mimir-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-mimir-fips"
    exit 1
  '';
}
