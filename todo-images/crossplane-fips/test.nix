{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-fips image
{
  name = "crossplane-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-fips"
    exit 1
  '';
}
