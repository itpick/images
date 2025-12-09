{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-alertmanager-iamguarded-fips image
{
  name = "prometheus-alertmanager-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-alertmanager-iamguarded-fips"
    exit 1
  '';
}
