{ pkgs, lib, ... }:

# TODO: Add tests for flux-source-controller-iamguarded image
{
  name = "flux-source-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-source-controller-iamguarded"
    exit 1
  '';
}
