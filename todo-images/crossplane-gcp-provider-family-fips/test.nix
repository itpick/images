{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-provider-family-fips image
{
  name = "crossplane-gcp-provider-family-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-provider-family-fips"
    exit 1
  '';
}
