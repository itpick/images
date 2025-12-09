{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-cloudplatform-fips image
{
  name = "crossplane-gcp-cloudplatform-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-cloudplatform-fips"
    exit 1
  '';
}
