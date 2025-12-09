{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-operator-fips image
{
  name = "prometheus-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-operator-fips"
    exit 1
  '';
}
