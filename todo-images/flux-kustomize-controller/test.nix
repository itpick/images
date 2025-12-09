{ pkgs, lib, ... }:

# TODO: Add tests for flux-kustomize-controller image
{
  name = "flux-kustomize-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-kustomize-controller"
    exit 1
  '';
}
