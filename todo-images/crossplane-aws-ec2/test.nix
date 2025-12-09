{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-ec2 image
{
  name = "crossplane-aws-ec2";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-ec2"
    exit 1
  '';
}
