{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-provisioner-fips image
{
  name = "kubernetes-csi-external-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-provisioner-fips"
    exit 1
  '';
}
