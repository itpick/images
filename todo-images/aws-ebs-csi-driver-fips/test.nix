{ pkgs, lib, ... }:

# TODO: Add tests for aws-ebs-csi-driver-fips image
{
  name = "aws-ebs-csi-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-ebs-csi-driver-fips"
    exit 1
  '';
}
