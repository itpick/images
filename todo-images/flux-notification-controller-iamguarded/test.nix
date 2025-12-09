{ pkgs, lib, ... }:

# TODO: Add tests for flux-notification-controller-iamguarded image
{
  name = "flux-notification-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-notification-controller-iamguarded"
    exit 1
  '';
}
