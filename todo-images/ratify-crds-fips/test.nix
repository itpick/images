{ pkgs, lib, ... }:

# TODO: Add tests for ratify-crds-fips image
{
  name = "ratify-crds-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ratify-crds-fips"
    exit 1
  '';
}
