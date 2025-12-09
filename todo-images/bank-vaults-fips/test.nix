{ pkgs, lib, ... }:

# TODO: Add tests for bank-vaults-fips image
{
  name = "bank-vaults-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bank-vaults-fips"
    exit 1
  '';
}
