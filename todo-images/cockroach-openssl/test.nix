{ pkgs, lib, ... }:

# TODO: Add tests for cockroach-openssl image
{
  name = "cockroach-openssl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cockroach-openssl"
    exit 1
  '';
}
