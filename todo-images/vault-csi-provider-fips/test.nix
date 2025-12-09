{ pkgs, lib, ... }:

# TODO: Add tests for vault-csi-provider-fips image
{
  name = "vault-csi-provider-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vault-csi-provider-fips"
    exit 1
  '';
}
