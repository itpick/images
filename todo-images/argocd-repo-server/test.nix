{ pkgs, lib, ... }:

# TODO: Add tests for argocd-repo-server image
{
  name = "argocd-repo-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argocd-repo-server"
    exit 1
  '';
}
