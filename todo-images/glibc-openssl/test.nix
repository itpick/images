{ pkgs, lib, ... }:

# TODO: Add tests for glibc-openssl image
{
  name = "glibc-openssl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for glibc-openssl"
    exit 1
  '';
}
