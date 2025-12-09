{ pkgs, lib, ... }:

# TODO: Add tests for gcp-compute-persistent-disk-csi-driver image
{
  name = "gcp-compute-persistent-disk-csi-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gcp-compute-persistent-disk-csi-driver"
    exit 1
  '';
}
