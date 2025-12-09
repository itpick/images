{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-automation-controller-iamguarded-fips image
{
  name = "flux-image-automation-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-automation-controller-iamguarded-fips"
    exit 1
  '';
}
