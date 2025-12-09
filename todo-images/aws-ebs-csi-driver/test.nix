{ pkgs, lib, ... }:

# TODO: Add tests for aws-ebs-csi-driver image
{
  name = "aws-ebs-csi-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-ebs-csi-driver"
    exit 1
  '';
}
