{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-automation-controller-fips image
{
  name = "flux-image-automation-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-automation-controller-fips"
    exit 1
  '';
}
