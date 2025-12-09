{ pkgs, lib, ... }:

# TODO: Add tests for flux-kustomize-controller-iamguarded image
{
  name = "flux-kustomize-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-kustomize-controller-iamguarded"
    exit 1
  '';
}
