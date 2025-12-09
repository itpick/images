{ pkgs, lib, ... }:

# TODO: Add tests for rook-ceph-fips image
{
  name = "rook-ceph-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rook-ceph-fips"
    exit 1
  '';
}
