{ pkgs, lib, ... }:

# TODO: Add tests for glibc-openssl-fips-mip image
{
  name = "glibc-openssl-fips-mip";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for glibc-openssl-fips-mip"
    exit 1
  '';
}
