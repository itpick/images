{ pkgs, lib, ... }:

# TODO: Add tests for gcp-compute-persistent-disk-csi-driver-fips image
{
  name = "gcp-compute-persistent-disk-csi-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gcp-compute-persistent-disk-csi-driver-fips"
    exit 1
  '';
}
