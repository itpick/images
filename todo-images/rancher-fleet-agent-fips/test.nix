{ pkgs, lib, ... }:

# TODO: Add tests for rancher-fleet-agent-fips image
{
  name = "rancher-fleet-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-fleet-agent-fips"
    exit 1
  '';
}
