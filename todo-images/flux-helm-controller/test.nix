{ pkgs, lib, ... }:

# TODO: Add tests for flux-helm-controller image
{
  name = "flux-helm-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-helm-controller"
    exit 1
  '';
}
