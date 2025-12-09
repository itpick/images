{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-kube-events image
{
  name = "newrelic-kube-events";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-kube-events"
    exit 1
  '';
}
