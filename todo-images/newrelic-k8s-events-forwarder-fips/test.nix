{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-k8s-events-forwarder-fips image
{
  name = "newrelic-k8s-events-forwarder-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-k8s-events-forwarder-fips"
    exit 1
  '';
}
