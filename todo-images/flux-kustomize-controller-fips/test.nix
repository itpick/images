{ pkgs, lib, ... }:

# TODO: Add tests for flux-kustomize-controller-fips image
{
  name = "flux-kustomize-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-kustomize-controller-fips"
    exit 1
  '';
}
