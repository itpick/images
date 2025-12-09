{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-compute-fips image
{
  name = "crossplane-gcp-compute-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-compute-fips"
    exit 1
  '';
}
