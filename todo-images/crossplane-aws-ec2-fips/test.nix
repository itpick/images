{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-ec2-fips image
{
  name = "crossplane-aws-ec2-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-ec2-fips"
    exit 1
  '';
}
