{ pkgs, lib, ... }:

# TODO: Add tests for flux-helm-controller-iamguarded image
{
  name = "flux-helm-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-helm-controller-iamguarded"
    exit 1
  '';
}
