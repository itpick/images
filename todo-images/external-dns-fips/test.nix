{ pkgs, lib, ... }:

# TODO: Add tests for external-dns-fips image
{
  name = "external-dns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for external-dns-fips"
    exit 1
  '';
}
