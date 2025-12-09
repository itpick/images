{ pkgs, lib, ... }:

# TODO: Add tests for vault-fips image
{
  name = "vault-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vault-fips"
    exit 1
  '';
}
