{ pkgs, lib, ... }:

# TODO: Add tests for ceph-csi-operator-fips image
{
  name = "ceph-csi-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ceph-csi-operator-fips"
    exit 1
  '';
}
