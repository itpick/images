{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-dns-fips image
{
  name = "crossplane-gcp-dns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-dns-fips"
    exit 1
  '';
}
