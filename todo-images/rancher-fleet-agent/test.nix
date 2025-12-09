{ pkgs, lib, ... }:

# TODO: Add tests for rancher-fleet-agent image
{
  name = "rancher-fleet-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-fleet-agent"
    exit 1
  '';
}
