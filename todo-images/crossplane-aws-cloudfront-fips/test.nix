{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-cloudfront-fips image
{
  name = "crossplane-aws-cloudfront-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-cloudfront-fips"
    exit 1
  '';
}
