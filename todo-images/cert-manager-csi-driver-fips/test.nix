{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-csi-driver-fips image
{
  name = "cert-manager-csi-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-csi-driver-fips"
    exit 1
  '';
}
