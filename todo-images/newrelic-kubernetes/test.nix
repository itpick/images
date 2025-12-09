{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-kubernetes image
{
  name = "newrelic-kubernetes";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-kubernetes"
    exit 1
  '';
}
