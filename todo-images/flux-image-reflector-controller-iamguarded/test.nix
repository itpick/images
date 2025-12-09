{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-reflector-controller-iamguarded image
{
  name = "flux-image-reflector-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-reflector-controller-iamguarded"
    exit 1
  '';
}
