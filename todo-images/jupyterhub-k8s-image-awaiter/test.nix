{ pkgs, lib, ... }:

# TODO: Add tests for jupyterhub-k8s-image-awaiter image
{
  name = "jupyterhub-k8s-image-awaiter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyterhub-k8s-image-awaiter"
    exit 1
  '';
}
