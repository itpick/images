{ pkgs, lib, ... }:

# TODO: Add tests for bank-vaults image
{
  name = "bank-vaults";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bank-vaults"
    exit 1
  '';
}
