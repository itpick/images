{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-provider-fips image
{
  name = "crossplane-aws-provider-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-provider-fips"
    exit 1
  '';
}
