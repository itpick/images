{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-infrastructure-k8s image
{
  name = "newrelic-infrastructure-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-infrastructure-k8s"
    exit 1
  '';
}
