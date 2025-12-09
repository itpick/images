{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-infrastructure-bundle-fips image
{
  name = "newrelic-infrastructure-bundle-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-infrastructure-bundle-fips"
    exit 1
  '';
}
