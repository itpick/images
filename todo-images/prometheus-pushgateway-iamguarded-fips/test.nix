{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pushgateway-iamguarded-fips image
{
  name = "prometheus-pushgateway-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pushgateway-iamguarded-fips"
    exit 1
  '';
}
