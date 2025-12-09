{ pkgs, lib, ... }:

# TODO: Add tests for aws-efs-csi-driver-fips image
{
  name = "aws-efs-csi-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-efs-csi-driver-fips"
    exit 1
  '';
}
