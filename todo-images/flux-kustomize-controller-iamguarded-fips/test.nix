{ pkgs, lib, ... }:

# TODO: Add tests for flux-kustomize-controller-iamguarded-fips image
{
  name = "flux-kustomize-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-kustomize-controller-iamguarded-fips"
    exit 1
  '';
}
