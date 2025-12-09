{ pkgs, lib, ... }:

# TODO: Add tests for flux-notification-controller image
{
  name = "flux-notification-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-notification-controller"
    exit 1
  '';
}
