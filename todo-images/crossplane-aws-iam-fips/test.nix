{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-iam-fips image
{
  name = "crossplane-aws-iam-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-iam-fips"
    exit 1
  '';
}
