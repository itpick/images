{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-sns-fips image
{
  name = "crossplane-aws-sns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-sns-fips"
    exit 1
  '';
}
