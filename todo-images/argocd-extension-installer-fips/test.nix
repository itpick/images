{ pkgs, lib, ... }:

# TODO: Add tests for argocd-extension-installer-fips image
{
  name = "argocd-extension-installer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argocd-extension-installer-fips"
    exit 1
  '';
}
