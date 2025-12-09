{ pkgs, lib, ... }:

# TODO: Add tests for rancher-agent image
{
  name = "rancher-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-agent"
    exit 1
  '';
}
