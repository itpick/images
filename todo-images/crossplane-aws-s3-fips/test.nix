{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-s3-fips image
{
  name = "crossplane-aws-s3-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-s3-fips"
    exit 1
  '';
}
