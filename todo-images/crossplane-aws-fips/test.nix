{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-fips image
{
  name = "crossplane-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-fips"
    exit 1
  '';
}
