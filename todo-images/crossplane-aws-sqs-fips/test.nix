{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-sqs-fips image
{
  name = "crossplane-aws-sqs-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-sqs-fips"
    exit 1
  '';
}
