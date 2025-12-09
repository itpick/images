{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pushgateway-fips image
{
  name = "prometheus-pushgateway-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pushgateway-fips"
    exit 1
  '';
}
