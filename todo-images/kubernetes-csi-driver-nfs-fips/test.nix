{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-driver-nfs-fips image
{
  name = "kubernetes-csi-driver-nfs-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-driver-nfs-fips"
    exit 1
  '';
}
