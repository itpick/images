{ pkgs, lib, ... }:

# TODO: Add tests for jupyterhub-k8s-network-tools image
{
  name = "jupyterhub-k8s-network-tools";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyterhub-k8s-network-tools"
    exit 1
  '';
}
