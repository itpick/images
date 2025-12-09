{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-snapshotter-fips image
{
  name = "kubernetes-csi-external-snapshotter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-snapshotter-fips"
    exit 1
  '';
}
