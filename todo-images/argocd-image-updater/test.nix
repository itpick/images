{ pkgs, lib, ... }:

# TODO: Add tests for argocd-image-updater image
{
  name = "argocd-image-updater";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argocd-image-updater"
    exit 1
  '';
}
