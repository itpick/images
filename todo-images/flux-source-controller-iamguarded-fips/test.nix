{ pkgs, lib, ... }:

# TODO: Add tests for flux-source-controller-iamguarded-fips image
{
  name = "flux-source-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-source-controller-iamguarded-fips"
    exit 1
  '';
}
