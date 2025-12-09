{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-prometheus image
{
  name = "newrelic-prometheus";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-prometheus"
    exit 1
  '';
}
