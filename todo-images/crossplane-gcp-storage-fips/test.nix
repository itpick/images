{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-storage-fips image
{
  name = "crossplane-gcp-storage-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-storage-fips"
    exit 1
  '';
}
