{ pkgs, lib, ... }:

# TODO: Add tests for mountpoint-s3-csi-driver image
{
  name = "mountpoint-s3-csi-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mountpoint-s3-csi-driver"
    exit 1
  '';
}
