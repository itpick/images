{ pkgs, lib, ... }:

# TODO: Add tests for external-dns-iamguarded-fips image
{
  name = "external-dns-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for external-dns-iamguarded-fips"
    exit 1
  '';
}
