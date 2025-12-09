{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-function-environment-configs-fips image
{
  name = "crossplane-function-environment-configs-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-function-environment-configs-fips"
    exit 1
  '';
}
