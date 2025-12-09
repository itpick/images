{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-alertmanager-fips image
{
  name = "prometheus-alertmanager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-alertmanager-fips"
    exit 1
  '';
}
