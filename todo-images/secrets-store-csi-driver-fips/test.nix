{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-fips image
{
  name = "secrets-store-csi-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-fips"
    exit 1
  '';
}
