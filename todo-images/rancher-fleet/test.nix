{ pkgs, lib, ... }:

# TODO: Add tests for rancher-fleet image
{
  name = "rancher-fleet";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-fleet"
    exit 1
  '';
}
