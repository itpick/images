{ pkgs, lib, ... }:

# TODO: Add tests for jupyterhub-k8s-hub image
{
  name = "jupyterhub-k8s-hub";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyterhub-k8s-hub"
    exit 1
  '';
}
