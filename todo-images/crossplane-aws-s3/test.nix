{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-s3 image
{
  name = "crossplane-aws-s3";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-s3"
    exit 1
  '';
}
