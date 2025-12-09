{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-dynamodb-fips image
{
  name = "crossplane-aws-dynamodb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-dynamodb-fips"
    exit 1
  '';
}
