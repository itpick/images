{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-terraform-fips image
{
  name = "crossplane-provider-terraform-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-terraform-fips"
    exit 1
  '';
}
