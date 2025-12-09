{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-rds-fips image
{
  name = "crossplane-aws-rds-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-rds-fips"
    exit 1
  '';
}
