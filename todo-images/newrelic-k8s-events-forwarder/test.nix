{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-k8s-events-forwarder image
{
  name = "newrelic-k8s-events-forwarder";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-k8s-events-forwarder"
    exit 1
  '';
}
