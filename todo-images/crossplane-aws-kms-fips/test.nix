{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-kms-fips image
{
  name = "crossplane-aws-kms-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-kms-fips"
    exit 1
  '';
}
