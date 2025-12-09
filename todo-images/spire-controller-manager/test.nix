{ pkgs, lib, ... }:

# TODO: Add tests for spire-controller-manager image
{
  name = "spire-controller-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-controller-manager"
    exit 1
  '';
}
