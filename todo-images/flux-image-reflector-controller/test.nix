{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-reflector-controller image
{
  name = "flux-image-reflector-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-reflector-controller"
    exit 1
  '';
}
