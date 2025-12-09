{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-cloudfront image
{
  name = "crossplane-aws-cloudfront";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-cloudfront"
    exit 1
  '';
}
