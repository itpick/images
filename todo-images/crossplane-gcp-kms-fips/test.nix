{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-kms-fips image
{
  name = "crossplane-gcp-kms-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-kms-fips"
    exit 1
  '';
}
