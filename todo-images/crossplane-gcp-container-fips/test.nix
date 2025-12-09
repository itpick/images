{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-container-fips image
{
  name = "crossplane-gcp-container-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-container-fips"
    exit 1
  '';
}
