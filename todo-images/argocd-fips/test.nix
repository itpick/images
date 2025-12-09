{ pkgs, lib, ... }:

# TODO: Add tests for argocd-fips image
{
  name = "argocd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argocd-fips"
    exit 1
  '';
}
