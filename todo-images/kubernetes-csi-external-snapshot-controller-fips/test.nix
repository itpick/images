{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-snapshot-controller-fips image
{
  name = "kubernetes-csi-external-snapshot-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-snapshot-controller-fips"
    exit 1
  '';
}
