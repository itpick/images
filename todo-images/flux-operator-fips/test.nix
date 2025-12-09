{ pkgs, lib, ... }:

# TODO: Add tests for flux-operator-fips image
{
  name = "flux-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-operator-fips"
    exit 1
  '';
}
