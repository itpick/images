{ pkgs, lib, ... }:

# TODO: Add tests for flux-image-reflector-controller-fips image
{
  name = "flux-image-reflector-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-image-reflector-controller-fips"
    exit 1
  '';
}
