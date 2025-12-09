{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-nri-statsd image
{
  name = "newrelic-nri-statsd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-nri-statsd"
    exit 1
  '';
}
