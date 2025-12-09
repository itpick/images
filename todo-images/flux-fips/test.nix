{ pkgs, lib, ... }:

# TODO: Add tests for flux-fips image
{
  name = "flux-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-fips"
    exit 1
  '';
}
