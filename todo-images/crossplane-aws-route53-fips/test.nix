{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-route53-fips image
{
  name = "crossplane-aws-route53-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-route53-fips"
    exit 1
  '';
}
