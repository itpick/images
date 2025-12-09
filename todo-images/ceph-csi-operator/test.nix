{ pkgs, lib, ... }:

# TODO: Add tests for ceph-csi-operator image
{
  name = "ceph-csi-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ceph-csi-operator"
    exit 1
  '';
}
