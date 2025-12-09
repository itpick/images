{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-automation-controller-iamguarded image
{
  name = "flux-image-automation-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-automation-controller-iamguarded"
    exit 1
  '';
}
