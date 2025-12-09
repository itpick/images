{ pkgs, lib, ... }:

# TODO: Add tests for ceph-fips image
{
  name = "ceph-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ceph-fips"
    exit 1
  '';
}
