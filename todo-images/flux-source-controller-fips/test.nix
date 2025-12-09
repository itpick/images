{ pkgs, lib, ... }:

# TODO: Add tests for flux-source-controller-fips image
{
  name = "flux-source-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-source-controller-fips"
    exit 1
  '';
}
