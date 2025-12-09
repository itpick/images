{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-attacher-fips image
{
  name = "kubernetes-csi-external-attacher-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-attacher-fips"
    exit 1
  '';
}
