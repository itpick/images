{ pkgs, lib, ... }:

# TODO: Add tests for glibc-openssl-fips image
{
  name = "glibc-openssl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for glibc-openssl-fips"
    exit 1
  '';
}
