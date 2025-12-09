{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-operator-iamguarded-fips image
{
  name = "prometheus-operator-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-operator-iamguarded-fips"
    exit 1
  '';
}
