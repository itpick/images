{ pkgs, lib, ... }:

# TODO: Add tests for flux-helm-controller-fips image
{
  name = "flux-helm-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-helm-controller-fips"
    exit 1
  '';
}
