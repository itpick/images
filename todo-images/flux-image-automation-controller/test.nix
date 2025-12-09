{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-automation-controller image
{
  name = "flux-image-automation-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-automation-controller"
    exit 1
  '';
}
