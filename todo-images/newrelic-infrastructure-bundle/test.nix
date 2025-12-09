{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-infrastructure-bundle image
{
  name = "newrelic-infrastructure-bundle";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-infrastructure-bundle"
    exit 1
  '';
}
