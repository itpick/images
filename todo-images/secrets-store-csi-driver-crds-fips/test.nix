{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-crds-fips image
{
  name = "secrets-store-csi-driver-crds-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-crds-fips"
    exit 1
  '';
}
