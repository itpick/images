{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-prometheus-configurator image
{
  name = "newrelic-prometheus-configurator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-prometheus-configurator"
    exit 1
  '';
}
