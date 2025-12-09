{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-iamguarded-fips image
{
  name = "prometheus-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-iamguarded-fips"
    exit 1
  '';
}
