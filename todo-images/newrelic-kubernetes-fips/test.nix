{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-kubernetes-fips image
{
  name = "newrelic-kubernetes-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-kubernetes-fips"
    exit 1
  '';
}
