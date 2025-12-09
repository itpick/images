{ pkgs, lib, ... }:

# TODO: Add tests for flux-helm-controller-iamguarded-fips image
{
  name = "flux-helm-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-helm-controller-iamguarded-fips"
    exit 1
  '';
}
