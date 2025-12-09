{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-lambda-fips image
{
  name = "crossplane-aws-lambda-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-lambda-fips"
    exit 1
  '';
}
