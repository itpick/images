{ pkgs, lib, ... }:

# TODO: Add tests for vc-controller-manager image
{
  name = "vc-controller-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-controller-manager"
    exit 1
  '';
}
