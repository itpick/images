{ pkgs, lib, ... }:

# TODO: Add tests for argocd-repo-server-fips image
{
  name = "argocd-repo-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argocd-repo-server-fips"
    exit 1
  '';
}
